local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--", "zsh" }
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.color_scheme = "Tokyo Night Storm"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
