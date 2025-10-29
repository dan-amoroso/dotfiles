local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Everforest Dark (Gogh)'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Cursor configuration for better visibility
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500 -- milliseconds
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- Make cursor more visible with a bright color
config.colors = {
  cursor_bg = '#7aa2f7', -- bright blue
  cursor_fg = '#1a1b26', -- dark foreground for contrast
  cursor_border = '#7aa2f7',
}

-- Animation settings (applies to pane/tab animations, not cursor trails)
config.animation_fps = 60
config.max_fps = 60

-- Key bindings
config.keys = {
  -- Reload config with Cmd+R (or Ctrl+R)
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action.ReloadConfiguration,
  },
}

return config
