return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"html",
				"cssls",
				"bashls",
				"lua_ls",
				"pyright",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"debugpy",
				"isort",
				"black",
				"stylua",
				"shfmt",
				"prettier",
				"prettierd",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
