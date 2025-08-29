return {
	"folke/twilight.nvim",
	opts = {
		keys = {
			vim.keymap.set("n", "<leader>tl", "<cmd>Twilight<CR>", { desc = "Twilight: Toggle Twilight" }),
		},
	},
}
