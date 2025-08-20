return {
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local ok, jdtls = pcall(require, "jdtls")
			if not ok then
				vim.notify("[jdtls] Plugin nvim-jdtls não encontrado", vim.log.levels.ERROR)
				return
			end

			local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
			local root_dir = require("jdtls.setup").find_root(root_markers) or vim.fn.getcwd()
			if not root_dir or root_dir == "" then
				vim.notify("[jdtls] root_dir indefinido", vim.log.levels.ERROR)
				return
			end

			local function short_hash(s)
				local sum = 5381
				for i = 1, #s do
					sum = (sum * 33 + s:byte(i)) % 4294967296
				end
				return string.format("%08x", sum)
			end
			local workspace_dir = string.format(
				"%s/jdtls-workspaces/%s-%s",
				vim.fn.stdpath("data"),
				vim.fn.fnamemodify(root_dir, ":t"),
				short_hash(root_dir)
			)
			vim.fn.mkdir(workspace_dir, "p")

			local function mason_path_of(pkg)
				local ok_mr, mr = pcall(require, "mason-registry")
				if ok_mr then
					local ok_pkg, pobj = pcall(mr.get_package, pkg)
					if ok_pkg and pobj then
						if type(pobj.get_install_path) == "function" then
							local okp, p = pcall(function()
								return pobj:get_install_path()
							end)
							if okp and p and vim.fn.isdirectory(p) == 1 then
								return p
							end
						end
						if type(pobj.install_path) == "function" then
							local okp, p = pcall(function()
								return pobj:install_path()
							end)
							if okp and p and vim.fn.isdirectory(p) == 1 then
								return p
							end
						end
						if type(pobj.install_path) == "string" then
							local p = pobj.install_path
							if p and vim.fn.isdirectory(p) == 1 then
								return p
							end
						end
					end
				end
				local p = vim.fn.stdpath("data") .. "/mason/packages/" .. pkg
				if vim.fn.isdirectory(p) == 1 then
					return p
				end
				return nil
			end

			local jdtls_path = mason_path_of("jdtls")
			if not jdtls_path or vim.fn.isdirectory(jdtls_path) == 0 then
				local p = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
				if vim.fn.isdirectory(p) == 1 then
					jdtls_path = p
				else
					local jhome = os.getenv("JDTLS_HOME")
					if jhome and jhome ~= "" and vim.fn.isdirectory(jhome) == 1 then
						jdtls_path = jhome
					else
						vim.notify(
							"[jdtls] pacote 'jdtls' não encontrado. Use :MasonInstall jdtls (ou defina $JDTLS_HOME).",
							vim.log.levels.ERROR
						)
						return
					end
				end
			end

			local sys = vim.loop.os_uname().sysname
			local arch = (vim.loop.os_uname().machine or ""):lower()
			local candidates = {}
			if sys == "Darwin" then
				if arch:find("arm") or arch:find("aarch64") then
					candidates = { "config_mac_arm", "config_mac" }
				else
					candidates = { "config_mac" }
				end
			elseif sys:match("Windows") then
				candidates = { "config_win" }
			else
				candidates = { "config_linux", "config_linux_aarch64", "config_linux_x86_64" }
			end
			local cfg_dir
			for _, c in ipairs(candidates) do
				local try = jdtls_path .. "/" .. c
				if vim.fn.isdirectory(try) == 1 then
					cfg_dir = try
					break
				end
			end
			if not cfg_dir then
				vim.notify(
					"[jdtls] diretório de configuração não encontrado (tentado: "
						.. table.concat(candidates, ", ")
						.. ")",
					vim.log.levels.ERROR
				)
				return
			end

			local java_bin = "java"
			local JAVA_HOME = os.getenv("JAVA_HOME")
			if JAVA_HOME and JAVA_HOME ~= "" then
				local candidate = JAVA_HOME .. "/bin/java"
				if vim.fn.executable(candidate) == 1 then
					java_bin = candidate
				end
			end
			if vim.fn.executable(java_bin) ~= 1 then
				vim.notify("[jdtls] java não encontrado no PATH/JAVA_HOME", vim.log.levels.ERROR)
				return
			end
			local function java_major(bin)
				local out = vim.fn.systemlist(bin .. " -version")
				local joined = table.concat(out, " ")
				local maj = joined:match('version%s+"(%d+)')
				if not maj then
					local m = joined:match('version%s+"1%.(%d+)')
					if m then
						return tonumber(m)
					end
				end
				return tonumber(maj)
			end
			local maj = java_major(java_bin)
			if not maj or maj < 21 then
				vim.notify(
					("[jdtls] Java %s detectado; é necessário Java 21+."):format(maj or "desconhecido"),
					vim.log.levels.ERROR
				)
				return
			end

			local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher.jar")
			if launcher == "" or vim.fn.filereadable(launcher) == 0 then
				launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
			end
			if launcher == "" or vim.fn.filereadable(launcher) == 0 then
				vim.notify(
					"[jdtls] Equinox launcher não encontrado em " .. jdtls_path .. "/plugins",
					vim.log.levels.ERROR
				)
				return
			end

			local lombok = jdtls_path .. "/lombok.jar"
			local has_lombok = vim.fn.filereadable(lombok) == 1

			local function jars_in(dir, pattern)
				if not dir or vim.fn.isdirectory(dir) == 0 then
					return {}
				end
				local ok2, list = pcall(vim.fn.globpath, dir, pattern, true, true)
				if not ok2 or not list then
					return {}
				end
				return list
			end

			local function find_debug_jars()
				local out = {}
				local java_debug_path = mason_path_of("java-debug-adapter")
				vim.list_extend(out, jars_in(java_debug_path, "extension/server/com.microsoft.java.debug.plugin-*.jar"))
				if #out == 0 then
					vim.list_extend(out, jars_in(java_debug_path, "**/com.microsoft.java.debug.plugin-*.jar"))
				end
				if #out == 0 then
					local mason_root = vim.fn.stdpath("data") .. "/mason"
					vim.list_extend(out, jars_in(mason_root, "**/com.microsoft.java.debug.plugin-*.jar"))
				end
				return out
			end

			local function find_test_jars()
				local out = {}
				local java_test_path = mason_path_of("java-test")
				vim.list_extend(out, jars_in(java_test_path, "extension/server/*.jar"))
				if #out == 0 then
					local mason_root = vim.fn.stdpath("data") .. "/mason"
					vim.list_extend(out, jars_in(mason_root, "**/java-test/**/server/*.jar"))
				end
				return out
			end

			local bundles = {}
			vim.list_extend(bundles, find_debug_jars())
			vim.list_extend(bundles, find_test_jars())

			vim.schedule(function()
				local msg = string.format("[jdtls] bundles carregados: %d", #bundles)
				if #bundles == 0 then
					msg = msg .. "\n[aviso] nenhum jar encontrado. Rode :MasonInstall java-debug-adapter java-test"
				end
				vim.notify(msg, vim.log.levels.INFO)
			end)

			local cmd = {
				java_bin,
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=WARN",
				"-Xms1g",
				"--add-modules",
				"ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				launcher,
				"-configuration",
				cfg_dir,
				"-data",
				workspace_dir,
			}
			if has_lombok then
				local inserted = false
				for i, v in ipairs(cmd) do
					if v == "-jar" then
						table.insert(cmd, i, "-javaagent:" .. lombok)
						inserted = true
						break
					end
				end
				if not inserted then
					table.insert(cmd, 7, "-javaagent:" .. lombok)
				end
			end

			local capabilities = {}
			local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
			if ok_cmp and cmp.default_capabilities then
				capabilities = cmp.default_capabilities()
			end
			local ext = jdtls.extendedClientCapabilities
			ext.resolveAdditionalTextEditsSupport = true

			local function safe_map(mode, lhs, rhs, opts)
				if rhs ~= nil then
					vim.keymap.set(mode, lhs, rhs, opts)
				end
			end

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true, noremap = true }

				safe_map(
					"n",
					"<leader>jo",
					jdtls.organize_imports,
					vim.tbl_extend("force", opts, { desc = "Java Organize Imports" })
				)
				safe_map(
					"n",
					"<leader>jt",
					jdtls.test_nearest_method,
					vim.tbl_extend("force", opts, { desc = "Java Test Method" })
				)
				safe_map(
					"n",
					"<leader>jT",
					jdtls.test_class,
					vim.tbl_extend("force", opts, { desc = "Java Test Class" })
				)
				safe_map("n", "<leader>jr", jdtls.restart, vim.tbl_extend("force", opts, { desc = "Java Restart LS" }))

				if jdtls.setup_dap then
					jdtls.setup_dap({ hotcodereplace = "auto" })
					vim.defer_fn(function()
						local cl = vim.lsp.get_clients({ bufnr = bufnr, name = "jdtls" })[1]
						if cl and cl.initialized then
							pcall(function()
								require("jdtls.dap").setup_dap_main_class_configs()
							end)
							local exec = cl.server_capabilities and cl.server_capabilities.executeCommandProvider
							local cmds = (exec and exec.commands) or {}
							local has_start = false
							for _, c in ipairs(cmds) do
								if c == "vscode.java.startDebugSession" then
									has_start = true
									break
								end
							end
							if not has_start then
								vim.notify(
									"[jdtls] O plugin de debug não foi carregado (sem vscode.java.startDebugSession).\n"
										.. "Verifique se 'java-debug-adapter' está instalado no Mason e se os bundles foram passados.",
									vim.log.levels.WARN
								)
							end
						end
					end, 600)
				end

				local dap_ok, dap = pcall(require, "dap")
				if dap_ok then
					vim.keymap.set("n", "<leader>jD", function()
						pcall(function()
							require("jdtls.dap").setup_dap_main_class_configs()
						end)
						dap.continue()
					end, vim.tbl_extend("force", opts, { desc = "Java: Discover mains + Debug" }))
				end

				if jdtls.setup and jdtls.setup.add_commands then
					jdtls.setup.add_commands()
				end
				if jdtls.update_project_config then
					jdtls.update_project_config()
				end
			end

			local config = {
				cmd = cmd,
				root_dir = root_dir,
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					java = {
						format = { enabled = false },
						signatureHelp = { enabled = true },
						contentProvider = { preferred = "fernflower" },
						completion = { favoriteStaticMembers = {}, filteredTypes = { "com.sun.*", "sun.*" } },
						configuration = { updateBuildConfiguration = "interactive" },
						references = { includeDecompiledSources = true },
						sources = { organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 } },
						saveActions = { organizeImports = true },
					},
				},
				init_options = { bundles = bundles, extendedClientCapabilities = ext },
			}

			vim.schedule(function()
				vim.notify(
					vim.inspect({
						java_bin = java_bin,
						java_version = vim.fn.systemlist(java_bin .. " -version")[1],
						jdtls_path = jdtls_path,
						cfg_dir = cfg_dir,
						launcher = launcher,
						workspace_dir = workspace_dir,
					}),
					vim.log.levels.INFO
				)
			end)

			jdtls.start_or_attach(config)
		end,
	},
}
