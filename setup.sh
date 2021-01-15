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
mkdir -p ~/.config/sway
ln -sf "$DIR/.config/sway/config" ~/.config/sway/config
mkdir -p ~/.config/waybar
ln -sf "$DIR/.config/waybar/config" ~/.config/waybar/config
ln -sf "$DIR/.config/waybar/style.css" ~/.config/waybar/style.css
mkdir -p ~/.config/mako
ln -sf "$DIR/.config/mako/config" ~/.config/mako/config
mkdir -p ~/.config/swaylock
ln -sf "$DIR/.config/swaylock/config" ~/.config/swaylock/config

# Locker
mkdir -p ~/.local/bin
ln -sf "$DIR/.local/bin/lock" ~/.local/bin/lock

# File manager
mkdir -p ~/.config/lf
ln -sf "$DIR/.config/lf/lfrc" ~/.config/lf/lfrc
ln -sf "$DIR/.config/lf/preview" ~/.config/lf/preview

# Terminal Emulator
mkdir -p ~/.config/alacritty
ln -sf "$DIR/.config/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

# Text Editor
mkdir -p ~/.config/nvim
ln -sf "$DIR/.config/nvim/basic.vim" ~/.config/nvim/basic.vim
ln -sf "$DIR/.config/nvim/fuzzy-finder.vim" ~/.config/nvim/fuzzy-finder.vim
ln -sf "$DIR/.config/nvim/fugitive.vim" ~/.config/nvim/fugitive.vim
ln -sf "$DIR/.config/nvim/gruvbox.vim" ~/.config/nvim/gruvbox.vim
ln -sf "$DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$DIR/.config/nvim/lightline.vim" ~/.config/nvim/lightline.vim
ln -sf "$DIR/.config/nvim/prettier.vim" ~/.config/nvim/prettier.vim
ln -sf "$DIR/.config/nvim/tabular.vim" ~/.config/nvim/tabular.vim
ln -sf "$DIR/.config/nvim/test.vim" ~/.config/nvim/test.vim
ln -sf "$DIR/.config/nvim/vimwiki.vim" ~/.config/nvim/vimwiki.vim
ln -sf "$DIR/.config/nvim/commentary.vim" ~/.config/nvim/commentary.vim
ln -sf "$DIR/.config/nvim/far.vim" ~/.config/nvim/far.vim
mkdir -p ~/.config/nvim/lua
ln -sf "$DIR/.config/nvim/lua/lsp.lua" ~/.config/nvim/lua/lsp.lua
ln -sf "$DIR/.config/nvim/lua/treesitter.lua" ~/.config/nvim/lua/treesitter.lua

# File Manager
mkdir -p ~/.config/ranger
ln -sf "$DIR/.config/ranger/rc.conf" ~/.config/ranger/rc.conf
ln -sf "$DIR/.config/ranger/rifle.conf" ~/.config/ranger/rifle.conf
ln -sf "$DIR/.config/ranger/scope.sh" ~/.config/ranger/scope.sh

# Music Player
mkdir -p ~/.config/spotifyd
ln -sf "$DIR/.config/spotifyd/spotifyd.conf" ~/.config/spotifyd/spotifyd.conf
mkdir -p ~/.config/spotify-tui
ln -sf "$DIR/.config/spotify-tui/config.yml" ~/.config/spotify-tui/config.yml

# Vimb
mkdir -p ~/.config/vimb
ln -sf "$DIR/.config/vimb/config" ~/.config/vimb/config
ln -sf "$DIR/.config/vimb/style.css" ~/.config/vimb/style.css

# Custom Services
mkdir -p ~/.config/systemd/user
ln -sf "$DIR/.config/systemd/user/spotifyd.service" ~/.config/systemd/user/spotifyd.service

# Browser
ln -sf "$DIR/.config/brave-flags.conf" ~/.config/brave-flags.conf

# Vimb
mkdir -p ~/.newsboat
ln -sf "$DIR/.newsboat/config" ~/.newsboat/config
ln -sf "$DIR/.newsboat/urls" ~/.newsboat/urls

echo "DONE!"


