local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--", "zsh" }
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font("MesloLGS NF")
config.font_size = 14
config.color_scheme = 'rose-pine'
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

return config