return {
	"crnvl96/lazydocker.nvim",
	keys = {
		vim.keymap.set(
			{ "n", "t" },
			"<leader>ld",
			"<cmd>lua require('lazydocker').toggle({ engine = 'docker'})<cr>",
			{ desc = "LazyDocker: Open LazyDocker" }
		),
	},
}
