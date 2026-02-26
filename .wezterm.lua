local wezterm = require('wezterm')

local config = wezterm.config_builder()

if wezterm.target_triple:find("windows") then
    config.default_prog = { 'powershell.exe' }
end

config.window_background_opacity = 0.7
config.font_size = 10.0
config.color_scheme = 'catppuccin-frappe'
config.font = wezterm.font("Comic Mono")

return config

