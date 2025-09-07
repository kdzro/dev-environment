return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
		config = function()
			local jdtls = require("jdtls")

			local mason_path = vim.fn.stdpath("data") .. "/mason"

			local jdtls_config_path = vim.fn.has("mac") == 1 and "/config_mac/" or "/config_linux/"

			local launcher_jar =
				vim.fn.glob(mason_path .. "/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", false, true)[1]

			if launcher_jar == nil then
				vim.notify(
					"Não foi possível encontrar o launcher.jar do jdtls. Verifique se o jdtls está instalado via Mason.",
					vim.log.levels.ERROR
				)
				return
			end

			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspaces/" .. project_name

			local bundles = vim.fn.glob(
				mason_path .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				true,
				true
			)

			vim.list_extend(
				bundles,
				vim.fn.glob(mason_path .. "/packages/java-test/extension/server/*.jar", true, true)
			)

			local config = {
				cmd = {
					"java",

					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.protocol=true",
					"-Dlog.level=ALL",
					"-Xmx1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",

					"-jar",
					launcher_jar,

					"-configuration",
					mason_path .. "/packages/jdtls" .. jdtls_config_path,

					"-data",
					workspace_dir,
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "gradlew" }),
				settings = { java = {} },
				init_options = {
					bundles = bundles,
				},
			}

			jdtls.start_or_attach(config)
		end,
	},
}
