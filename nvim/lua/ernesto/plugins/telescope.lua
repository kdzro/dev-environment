return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"debugloop/telescope-undo.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local keymap = vim.keymap

		local trouble_telescope = pcall(require, "trouble.sources.telescope") and require("trouble.sources.telescope")
			or nil

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-t>"] = trouble_telescope and trouble_telescope.open or nil,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope: Fuzzy find files" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope: Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: Fuzzy string" })
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Telescope: Find string under cursor" }
		)
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope: Find todos" })
		keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Telescope: Show all keymaps" })
		keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope: Visualize undo history" })
	end,
}
