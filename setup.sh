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
ln -sfn "$DIR/.config/waybar" ~/.config/waybar
ln -sfn "$DIR/.config/workstyle" ~/.config/workstyle

# Notifications
mkdir -p ~/.config/mako
ln -sf "$DIR/.config/mako/config" ~/.config/mako/config

# Locker
mkdir -p ~/.config/swaylock
ln -sf "$DIR/.config/swaylock/config" ~/.config/swaylock/config

# File manager
mkdir -p ~/.config/lf
ln -sf "$DIR/.config/lf/lfrc" ~/.config/lf/lfrc
ln -sf "$DIR/.config/lf/preview" ~/.config/lf/preview

# Terminal Emulator
stow -vt ~ alacritty

# Editor
mkdir -p ~/.config/nvim
ln -sf "$DIR/.config/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DIR/.config/nvim/lua" ~/.config/nvim/lua

# Browsers
ln -sf "$DIR/.config/brave-flags.conf" ~/.config/brave-flags.conf
ln -sf "$DIR/.config/qutebrowser/config.py" ~/.config/qutebrowser/config.py
ln -sf "$DIR/.config/qutebrowser/gruvbox.py" ~/.config/qutebrowser/gruvbox.py

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


