local wezterm = require('wezterm')
local theme = 'catppuccin-light'

-- Opciones básicas
local config = {
    font = wezterm.font('Iosevka NF'),
    font_size = 14,
    cursor_blink_rate = 0,
    enable_tab_bar = false,
    color_scheme = theme,
    force_reverse_video_cursor = true,
    audible_bell = 'Disabled',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    },
}

-- Alternar ligaduras
wezterm.on('toggle-ligature', function(window, _)
    local overrides = window:get_config_overrides() or {}
    if not overrides.harfbuzz_features then
        overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
    else
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

-- Atajos de teclado
config.keys = {
    {
        key = 'L',
        mods = 'ALT',
        action = wezterm.action.EmitEvent('toggle-ligature'),
    },
}

return config
