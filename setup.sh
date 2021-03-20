#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

# Fish
mkdir -p ~/.config/fish
ln -sf "$DIR/.config/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$DIR/.config/fish/aliases.fish" ~/.config/fish/aliases.fish
mkdir -p ~/.config/fish/conf.d
ln -sf "$DIR/.config/fish/conf.d/sway.fish" ~/.config/fish/conf.d/sway.fish

# Starship
ln -sf "$DIR/.config/starship.toml" ~/.config/starship.toml

# Git
ln -sf "$DIR/.gitconfig" ~/.gitconfig

# Window Manager
ln -sf "$DIR/.config/sway" ~/.config/sway

# System bar
ln -sf "$DIR/.config/waybar" ~/.config/waybar

# Notifications
mkdir -p ~/.config/mako
ln -sf "$DIR/.config/mako/config" ~/.config/mako/config

# Locker
mkdir -p ~/.config/swaylock
ln -sf "$DIR/.config/swaylock/config" ~/.config/swaylock/config
mkdir -p ~/.local/bin
ln -sf "$DIR/.local/bin/lock" ~/.local/bin/lock

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
ln -sf "$DIR/.config/nvim/lua" ~/.config/nvim/lua

# Browser
ln -sf "$DIR/.config/brave-flags.conf" ~/.config/brave-flags.conf

# Newsboat
mkdir -p ~/.newsboat
ln -sf "$DIR/.newsboat/config" ~/.newsboat/config
ln -sf "$DIR/.newsboat/urls" ~/.newsboat/urls

echo "DONE!"


