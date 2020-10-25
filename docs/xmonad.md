# Xmonad

## Requirements

- xprop
- xdotool
- i3lock

```sh
yay -S xprop xdotool i3lock
```

## Install

```sh
yay -S xmonad xmonad-contrib xmobar
```

## Keybindings

The Mod key is <kbd>Win</kbd>

### Launching and killings programs

- <kbd>Mod</kbd> + <kbd>Enter</kbd> Launch terminal
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>enter</kbd> Launch file manager
- <kbd>Mod</kbd> + <kbd>p</kbd> Prompt for program
- <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>p</kbd> Gpick
- <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>c</kbd> Peek
- <kbd>Mod</kbd> + <kbd>Alt</kbd> + <kbd>f</kbd> Flameshot

### Layouts

- <kbd>Mod</kbd> + <kbd>tab</kbd> Rotate between the layouts

### Xmonad

- <kbd>Mod</kbd> + <kbd>q</kbd> Prompt to quit xmonad
- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>r</kbd> Recompile xmonad
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd> Reload xmonad
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>l</kbd> Lock screen

### Workspaces

- <kbd>Mod</kbd> + <kbd>[1..9]</kbd> Switch to workSpace N
- <kbd>Mod</kbd> + <kbd>Shift</kbd> + <kbd>[1..9]</kbd> Move client to workSpace
  N

### Screens

- <kbd>Mod</kbd> + <kbd>,</kbd> Switch to the right screen
- <kbd>Mod</kbd> + <kbd>.</kbd> Switch to the left screen

### Mouse bindings

- <kbd>Mod</kbd> + <kbd>LMB</kbd> Set the window to floating mode and move by
  dragging
- <kbd>Mod</kbd> + <kbd>CMB</kbd> Raise the window to the top of the stack
- <kbd>Mod</kbd> + <kbd>RMB</kbd> Set the window to floating mode and resize by
  dragging

### Scratchpads

- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>n</kbd> Node scratchpad
- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>b</kbd> Bpytop scratchpad
- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>s</kbd> Spotify-tui scratchpad
- <kbd>Mod</kbd> + <kbd>Ctrl</kbd> + <kbd>Enter</kbd> Terminal scratchpad

## Xorg

I use a definition for the device entry of xorg:

```sh
sudo cp etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf
```

## References

- https://github.com/xmonad/xmonad/blob/master/src/XMonad/Config.hs
- https://gitlab.com/dwt1/dotfiles/-/blob/master/.xmonad/xmonad.hs
- https://github.com/nnoell/dotfiles/blob/master/v4.4/xmonad/xmonad.hs
- https://wiki.haskell.org/Xmonad/Config_archive/ivy-foster-xmonad.hs
