return {
	"WilliamHsieh/overlook.nvim",
	opts = {},
	keys = {
		{
			"<leader>pd",
			function()
				require("overlook.api").peek_definition()
			end,
			desc = "Overlook: Peek definition",
		},
		{
			"<leader>pp",
			function()
				require("overlook.api").peek_cursor()
			end,
			desc = "Overlook: Create popup at current cursor position",
		},
		{
			"<leader>pu",
			function()
				require("overlook.api").restore_popup()
			end,
			desc = "Overlook: Restore last closed popup",
		},
		{
			"<leader>pU",
			function()
				require("overlook.api").restore_all_popups()
			end,
			desc = "Overlook: Restore all closed popups",
		},
		{
			"<leader>pc",
			function()
				require("overlook.api").close_all()
			end,
			desc = "Overlook: Close all popups",
		},
		{
			"<leader>pf",
			function()
				require("overlook.api").switch_focus()
			end,
			desc = "Overlook: Switch focus",
		},
		{
			"<leader>ps",
			function()
				require("overlook.api").open_in_split()
			end,
			desc = "Overlook: Promote popup to horizontal split",
		},
		{
			"<leader>pv",
			function()
				require("overlook.api").open_in_vsplit()
			end,
			desc = "Overlook: Promote popup to vertical split",
		},
		{
			"<leader>pt",
			function()
				require("overlook.api").open_in_tab()
			end,
			desc = "Overlook: Promote popup to new tab",
		},
		{
			"<leader>po",
			function()
				require("overlook.api").open_in_original_window()
			end,
			desc = "Overlook: Replace current window with popup content",
		},
	},
}
