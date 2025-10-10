return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = {
			char = "┊",
		},
		scope = {
			enabled = true,
			highlight = "IblScope",
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"NvimTree",
				"TelescopePrompt",
				"lazy",
				"mason",
			},
			buftypes = { "terminal" },
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)

		vim.api.nvim_set_hl(0, "IblScope", { bg = "#504945" })
	end,
}
