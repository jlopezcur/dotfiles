#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

# Bash
ln -sf "$DIR/.bashrc" ~/.bashrc
ln -sf "$DIR/.bash_aliases" ~/.bash_aliases
ln -sf "$DIR/.inputrc" ~/.inputrc

# Git
ln -sf "$DIR/.gitconfig" ~/.gitconfig

# Window Manager
ln -sf "$DIR/.Xresources" ~/.Xresources
ln -sf "$DIR/.xinitrc" ~/.xinitrc
mkdir -p ~/.xmonad
ln -sf "$DIR/.xmonad/xmonad.hs" ~/.xmonad/xmonad.hs
ln -sf "$DIR/.xmonad/xmonad.md" ~/.xmonad/xmonad.md
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
ln -sf "$DIR/.config/nvim/dirvish.vim" ~/.config/nvim/dirvish.vim
ln -sf "$DIR/.config/nvim/fugitive.vim" ~/.config/nvim/fugitive.vim
ln -sf "$DIR/.config/nvim/fzf.vim" ~/.config/nvim/fzf.vim
ln -sf "$DIR/.config/nvim/gruvbox.vim" ~/.config/nvim/gruvbox.vim
ln -sf "$DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$DIR/.config/nvim/lightline.vim" ~/.config/nvim/lightline.vim
ln -sf "$DIR/.config/nvim/nerdcommenter.vim" ~/.config/nvim/nerdcommenter.vim
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

# Custom Services
mkdir -p ~/.config/systemd
ln -sf "$DIR/.config/systemd/spotify.service" ~/.config/systemd/spotify.service

echo "DONE!"


