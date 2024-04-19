local wezterm = require 'wezterm';
return {
  font = wezterm.font("FiraCode Nerd Font"),
  color_scheme = "Tokyo Night",
  enable_tab_bar = false,
  font_size = 11.0,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  hide_mouse_cursor_when_typing = true,
  window_background_opacity = 0.95,
  default_prog = { '/usr/bin/zellij' },
}
