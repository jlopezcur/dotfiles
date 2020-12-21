#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

# Fish
mkdir -p ~/.config/fish
ln -sf "$DIR/.config/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$DIR/.config/fish/aliases.fish" ~/.config/fish/aliases.fish

# Starship
ln -sf "$DIR/.config/starship.toml" ~/.config/starship.toml

# Git
ln -sf "$DIR/.gitconfig" ~/.gitconfig

# Window Manager
ln -sf "$DIR/.Xresources" ~/.Xresources
ln -sf "$DIR/.xinitrc" ~/.xinitrc
mkdir -p ~/.xmonad
ln -sf "$DIR/.xmonad/xmonad.hs" ~/.xmonad/xmonad.hs
mkdir -p ~/.config/xmobar
ln -sf "$DIR/.config/xmobar/xmobar.hs" ~/.config/xmobar/xmobar.hs
mkdir -p ~/.config/picom
ln -sf "$DIR/.config/picom/picom.conf" ~/.config/picom/picom.conf

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
mkdir -p ~/.config/systemd
ln -sf "$DIR/.config/systemd/spotify.service" ~/.config/systemd/spotify.service

echo "DONE!"


