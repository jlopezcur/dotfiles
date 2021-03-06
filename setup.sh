#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

# Fish
mkdir -p ~/.config/fish
ln -sf "$DIR/.config/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$DIR/.config/fish/aliases.fish" ~/.config/fish/aliases.fish
mkdir -p ~/.config/fish/conf.d
ln -sf "$DIR/.config/fish/conf.d/sway.fish" ~/.config/fish/conf.d/sway.fish
ln -sf "$DIR/.config/fish/conf.d/bangbang.fish" ~/.config/fish/conf.d/bangbang.fish
ln -sf "$DIR/.config/fish/conf.d/lf.fish" ~/.config/fish/conf.d/lf.fish

# Starship
ln -sf "$DIR/.config/starship.toml" ~/.config/starship.toml

# Git
ln -sf "$DIR/.gitconfig" ~/.gitconfig

# Window Manager
ln -sfn "$DIR/.config/sway" ~/.config/sway

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
mkdir -p ~/.config/alacritty
ln -sf "$DIR/.config/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

# Editor
mkdir -p ~/.config/nvim
ln -sf "$DIR/.config/nvim/init.lua" ~/.config/nvim/init.lua
ln -sfn "$DIR/.config/nvim/lua" ~/.config/nvim/lua

# Browsers
ln -sf "$DIR/.config/brave-flags.conf" ~/.config/brave-flags.conf
ln -sf "$DIR/.config/qutebrowser/config.py" ~/.config/qutebrowser/config.py
ln -sf "$DIR/.config/qutebrowser/gruvbox.py" ~/.config/qutebrowser/gruvbox.py

# Newsboat
mkdir -p ~/.config/newsboat
ln -sf "$DIR/.config/newsboat/config" ~/.config/newsboat/config
ln -sf "$DIR/.config/newsboat/urls" ~/.config/newsboat/urls

# Scripts
ln -sf "$DIR/.local/bin/create-gif" ~/.local/bin/create-gif
ln -sf "$DIR/.local/bin/create-video" ~/.local/bin/create-video

# App launchers
mkdir -p ~/.local/share/applications
ln -sf "$DIR/.local/share/applications/slack.desktop" ~/.local/share/applications/slack.desktop
ln -sf "$DIR/.local/share/applications/scrcpy.desktop" ~/.local/share/applications/scrcpy.desktop
ln -sf "$DIR/.local/share/applications/zathura.desktop" ~/.local/share/applications/zathura.desktop

echo "DONE!"


