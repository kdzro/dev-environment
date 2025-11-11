return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local devicons = require("nvim-web-devicons")

		local function os_arch()
			local icon_info = devicons.get_icon("arch")
			return icon_info or "󰣇 "
		end

		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					{ "branch" },
					{ "diagnostics" },
					{ "diff" },
				},
				lualine_c = {},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ffa066" },
					},
					{ "encoding" },
					{ os_arch },
					{ "filetype" },
				},
				lualine_y = {
					{ "tabs" },
				},
				lualine_z = {
					{ "progress" },
					{ "location" },
				},
			},
		})
	end,
}
