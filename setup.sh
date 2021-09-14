#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

stow -vt ~ fish # Fish
stow -vt ~ starship # Starship
stow -vt ~ git # Git
stow -vt ~ sway # Window manager
stow -vt ~ waybar # System bar
# stow -vt ~ workstyle
stow -vt ~ mako # Notifications
stow -vt ~ swaylock # Locker
stow -vt ~ lf # File manager
stow -vt ~ alacritty # Terminal emulator
stow -vt ~ nvim # Editor
stow -vt ~ qutebrowser # Primary browsers
stow -vt ~ brave # Secondary browser
stow -vt ~ newsboat # Newsboat
stow -vt ~ zathura # PDF Reader
stow -vt ~ slack # Slack
stow -vt ~ scrcpy # Mobile viewer
stow -vt ~ bpytop # Process monitor

# Scripts
ln -sf "$DIR/.local/bin/create-gif" ~/.local/bin/create-gif
ln -sf "$DIR/.local/bin/create-video" ~/.local/bin/create-video

echo "DONE!"
