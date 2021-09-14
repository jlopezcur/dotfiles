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

# Launcher
ln -sfn "$DIR/.config/sway-launcher-desktop" ~/.config/sway-launcher-desktop

# System bar
stow -vt ~ waybar
# stow -vt ~ workstyle

# Notifications
stow -vt ~ mako

# Locker
mkdir -p ~/.config/swaylock
ln -sf "$DIR/.config/swaylock/config" ~/.config/swaylock/config

# File manager
stow -vt ~ lf

# Terminal Emulator
stow -vt ~ alacritty

# Editor
mkdir -p ~/.config/nvim
ln -sf "$DIR/.config/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DIR/.config/nvim/lua" ~/.config/nvim/lua

# Browsers
ln -sf "$DIR/.config/brave-flags.conf" ~/.config/brave-flags.conf
stow -vt ~ qutebrowser

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


