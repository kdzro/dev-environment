return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>r", substitute.operator, { desc = "Substitute-nvim: Substitute with motion" })
		keymap.set("n", "<leader>rr", substitute.line, { desc = "Substitute-nvim: Substitute line" })
		keymap.set("n", "<leader>R", substitute.eol, { desc = "Substitute-nvim: Substitute to end of line" })
		keymap.set("x", "<leader>r", substitute.visual, { desc = "Substitute-nvim: Substitute in visual mode" })
	end,
}
