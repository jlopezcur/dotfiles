#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

stow -vt ~ fish # Fish
stow -vt ~ starship # Starship
stow -vt ~ git # Git
stow -vt ~ sway # Window Manager
stow -vt ~ waybar # System bar
# stow -vt ~ workstyle
stow -vt ~ mako # Notifications
stow -vt ~ swaylock # Locker
stow -vt ~ lf # File manager
stow -vt ~ alacritty # Terminal Emulator
stow -vt ~ nvim # Editor
stow -vt ~ qutebrowser # Primary Browsers
stow -vt ~ brave # Secondary Browser
stow -vt ~ newsboat # Newsboat
stow -vt ~ zathura # PDF Reader
stow -vt ~ slack # Slack

# Scripts
ln -sf "$DIR/.local/bin/create-gif" ~/.local/bin/create-gif
ln -sf "$DIR/.local/bin/create-video" ~/.local/bin/create-video

# App launchers
mkdir -p ~/.local/share/applications
ln -sf "$DIR/.local/share/applications/scrcpy.desktop" ~/.local/share/applications/scrcpy.desktop

echo "DONE!"


