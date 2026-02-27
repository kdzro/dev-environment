-- Calling Wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Default shell
config.default_prog = { "wsl.exe", "-d", "archlinux" }

-- Font configuration
config.font = wezterm.font("Maple Mono NF")
config.font_size = 14.0

-- Default theme
config.color_scheme = "rose-pine"

-- Window configuration
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.initial_cols = 128
config.initial_rows = 32

-- Tab bar configuration
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true

-- Cursor configuration
config.default_cursor_style = "SteadyBlock"

-- Bell configuration
config.audible_bell = "Disabled"

return config
