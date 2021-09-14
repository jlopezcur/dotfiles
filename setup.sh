#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

# Fish
stow -vt ~ fish

# Starship
stow -vt ~ starship

# Git
stow -vt ~ git

# Window Manager
stow -vt ~ sway

# System bar
stow -vt ~ waybar
# stow -vt ~ workstyle

# Notifications
stow -vt ~ mako

# Locker
stow -vt ~ swaylock

# File manager
stow -vt ~ lf

# Terminal Emulator
stow -vt ~ alacritty

# Editor
stow -vt ~ nvim

# Browsers
stow -vt ~ qutebrowser
stow -vt ~ brave

# Newsboat
stow -vt ~ newsboat

# Scripts
ln -sf "$DIR/.local/bin/create-gif" ~/.local/bin/create-gif
ln -sf "$DIR/.local/bin/create-video" ~/.local/bin/create-video

# App launchers
mkdir -p ~/.local/share/applications
ln -sf "$DIR/.local/share/applications/slack.desktop" ~/.local/share/applications/slack.desktop
ln -sf "$DIR/.local/share/applications/scrcpy.desktop" ~/.local/share/applications/scrcpy.desktop
ln -sf "$DIR/.local/share/applications/zathura.desktop" ~/.local/share/applications/zathura.desktop

echo "DONE!"


