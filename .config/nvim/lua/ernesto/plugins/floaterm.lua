return {
	"nvzone/floaterm",
	dependencies = {
		"nvzone/volt",
	},
	opts = {},
	cmd = "FloatermToggle",
	mappings = {
		vim.keymap.set("n", "<leader>tm", "<cmd>FloatermToggle<CR>", { desc = "Floaterm: Toggle Floaterm" }),
	},
}
