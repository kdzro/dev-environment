return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"rcarriga/nvim-notify",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		require("noice").setup({
			keymap = {
				vim.keymap.set("n", "<leader>nl", "<cmd>NoiceDismiss<CR>", { desc = "Noice: Dismiss Noice Messages" }),
			},
		})
	end,
}
