return {
	"rachartier/tiny-glimmer.nvim",
	opts = {
		refresh_interval_ms = 1,
		overwrite = {
			yank = {
				enabled = true,
				default_animation = {
					name = "pulse",
					settings = {
						from_color = "#938AA9",
					},
				},
			},
			paste = {
				enabled = true,
				default_animation = {
					name = "pulse",
					settings = {
						from_color = "#FFA066",
					},
				},
			},
			undo = {
				enabled = true,
				default_animation = {
					name = "fade",
					settings = {
						from_color = "#76946A",
					},
				},
			},
			redo = {
				enabled = true,
				default_animation = {
					name = "fade",
					settings = {
						from_color = "#FF5D62",
					},
				},
			},
		},
	},
}
