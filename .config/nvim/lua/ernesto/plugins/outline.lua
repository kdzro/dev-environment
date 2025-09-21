return {
	"stevearc/aerial.nvim",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{a", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}a", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
			layout = {
				width = "30",
				default_direction = "prefer_right",
			},
		})
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
	end,
}
