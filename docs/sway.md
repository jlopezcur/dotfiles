# SWAY

## Requirements

- [waybar](https://github.com/Alexays/Waybar)
- [alacritty](https://github.com/alacritty/alacritty)
- [bemenu](https://github.com/Cloudef/bemenu)
- [gammastep](https://gitlab.com/chinstrap/gammastep)
- [mako](https://github.com/emersion/mako)
- [swaylock](https://github.com/swaywm/swaylock)
- [swayidle](https://github.com/swaywm/swayidle)
- [grim](https://github.com/emersion/grim)
- [pulseaudio-ctl](https://github.com/graysky2/pulseaudio-ctl)
- [brightness-ctl](https://github.com/Hummer12007/brightnessctl)
- [player-ctl](https://github.com/altdesktop/playerctl)

```sh
yay -S waybar alacritty bemenu gammastep mako swaylock swayidle grim pulseaudioctl brightnessctl playerctl
```

## Install

```sh
yay -S sway
```

## Keybindings

The Mod key is <kbd>Win</kbd>

### Launching and killings programs

- <kbd>Mod</kbd> + <kbd>Enter</kbd> Launch terminal
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>enter</kbd> Launch file manager
- <kbd>Mod</kbd> + <kbd>p</kbd> Prompt for program
<!-- - <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>p</kbd> Prompt for password manager -->
<!-- - <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>p</kbd> Gpick -->
<!-- - <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>c</kbd> Peek -->
<!-- - <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>f</kbd> Flameshot -->

### Layouts

- <kbd>Mod</kbd> + <kbd>w</kbd> Tabbed layout
- <kbd>Mod</kbd> + <kbd>e</kbd> ? layout
- <kbd>Mod</kbd> + <kbd>s</kbd> Stacked layout

### Sway

- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>e</kbd> Prompt to quit sway
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd> Reload sway
- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>l</kbd> Lock screen

### Workspaces

- <kbd>Mod</kbd> + <kbd>[1..9]</kbd> Switch to workSpace N
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>[1..9]</kbd> Move client to workSpace
  N

### Screens

- <kbd>Mod</kbd> + <kbd>.</kbd> Switch the workspace to the HDMI-A-1
- <kbd>Mod</kbd> + <kbd>,</kbd> Switch the workspace to the eDP-1

### Floating Windows

- <kbd>Mod</kbd> + <kbd>LMB</kbd> Set the window to floating mode and move by
  dragging
- <kbd>Mod</kbd> + <kbd>CMB</kbd> Raise the window to the top of the stack
- <kbd>Mod</kbd> + <kbd>RMB</kbd> Set the window to floating mode and resize by
  dragging
- <kbd>Mod</kbd> + <kbd>BackSpace</kbd> Put selected window back to layout.
<!-- - <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>BackSpace</kbd> Put all windows back -->
<!--   to layout. -->

### Scratchpads

- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>-</kbd> Put client into scratchpad
- <kbd>Mod</kbd> + <kbd>-</kbd> Toggle scratchpad

## References

- https://github.com/naibaf0/dotfiles
