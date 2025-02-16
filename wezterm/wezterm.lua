local wezterm = require('wezterm')
local theme = 'catppuccin-light'

-- Opciones básicas
local config = {
    font = wezterm.font('Iosevka NF'),
    font_size = 14,
    max_fps = 10,
    cursor_blink_rate = 0,
    enable_tab_bar = false,
    color_scheme = theme,
    force_reverse_video_cursor = true,
    audible_bell = 'Disabled',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    },
}

return config
