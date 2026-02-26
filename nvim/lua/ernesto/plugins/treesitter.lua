return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"python",
			"lua",
			"html",
			"css",
			"json",
			"markdown",
			"markdown_inline",
			"dockerfile",
			"gitignore",
			"toml",
			"yaml",
			"bash",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"python",
				"lua",
				"html",
				"css",
				"json",
				"markdown",
				"dockerfile",
				"toml",
				"yaml",
				"bash",
				"zsh",
			},
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		vim.treesitter.language.register("bash", "zsh")
	end,
}
