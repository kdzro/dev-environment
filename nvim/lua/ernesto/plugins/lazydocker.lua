return {
	"crnvl96/lazydocker.nvim",
	keys = {
		{
			"<leader>ld",
			"<cmd>lua require('lazydocker').toggle({ engine = 'docker'})<cr>",
			mode = { "n", "t" },
			desc = "LazyDocker: Open LazyDocker",
		},
	},
}
