return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
		config = function()
			local jdtls = require("jdtls")

			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = "/mnt/c/Users/ernes/OneDrive/Documentos/estudos/estudos-udemy/estudos-java/"
				.. project_name

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
					"/home/kdzero/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",

					"-configuration",
					"/home/kdzero/.local/share/nvim/mason/packages/jdtls/config_linux/",

					"-data",
					workspace_dir,
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "gradlew" }),
				settings = { java = {} },
				init_options = {
					bundles = {
						vim.fn.glob(
							"/home/kdzero/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
						),

						vim.fn.glob("/home/kdzero/.local/share/nvim/mason/packages/java-test/extension/server/*.jar"),
					},
				},
			}

			jdtls.start_or_attach(config)
		end,
	},
}
