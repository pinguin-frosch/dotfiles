local wezterm = require('wezterm')
local config = {}

-- Opciones básicas
config.font = wezterm.font('FantasqueSansM Nerd Font')
config.max_fps = 144
config.cursor_blink_rate = 0
config.font_size = 16
config.enable_tab_bar = false
config.color_scheme = 'Catppuccin Mocha'
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
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
