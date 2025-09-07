return {
	"nvzone/floaterm",
	dependencies = {
		"nvzone/volt",
	},
	opts = {},
	cmd = "FloatermToggle",
	keys = {
		vim.keymap.set("n", "<leader>tm", "<cmd>FloatermToggle<CR>", { desc = "Floaterm: Toggle Floaterm" }),
	},
}
