return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"python",
				"lua",
				"html",
				"css",
				"json",
				"markdown",
				"markdown_inline",
				"bash",
				"dockerfile",
				"gitignore",
				"toml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		vim.treesitter.language.register("bash", "zsh")
	end,
}
