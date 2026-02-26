return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				theme = "rose-pine",
			},
			sections = {
				lualine_a = {
					{ "mode", icon = { "", align = "left" }, separator = { left = "", right = "" } },
				},
				lualine_b = {
					{ "branch" },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						separator = { right = "" },
					},
				},
				lualine_c = {
					{ "diagnostics" },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ebbcba" },
					},
					{ "filetype" },
				},
				lualine_y = {
					{ "progress" },
				},
				lualine_z = {
					{ "location" },
				},
			},
		})
	end,
}
