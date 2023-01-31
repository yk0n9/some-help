local wezterm = require 'wezterm'

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    default_prog = {'powershell.exe'}
end

return {
    font_size = 13,
    font = wezterm.font 'JetBrains Mono',
    color_scheme = 'Dracula',
    window_background_opacity = 0.8,
    default_prog = default_prog,
}
