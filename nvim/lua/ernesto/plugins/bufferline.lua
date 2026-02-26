return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local highlights = require("rose-pine.plugins.bufferline")
		require("bufferline").setup({
			highlights = highlights,
			options = {
				mode = "tabs",

				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},

				always_show_bufferline = true,

				show_close_icon = true,
				show_buffer_close_icons = true,

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or (level:match("warn") and " " or " ")
					return " " .. icon .. count
				end,
			},
		})
	end,
}
