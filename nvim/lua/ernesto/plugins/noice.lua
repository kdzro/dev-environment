return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		require("noice").setup({})

		vim.keymap.set("n", "<leader>nl", "<cmd>NoiceDismiss<CR>", { desc = "Noice: Dismiss Noice Messages" })
	end,
}
