#!/bin/bash

# ------------------------------------------------------------------------------
# Feed the configutarion files of the repo with the system ones
# ------------------------------------------------------------------------------

# alacritty
cp -v ~/.config/alacritty/alacritty.yml config/alacritty/

# xmonad
cp -v ~/.xmonad/xmonad.hs config/xmonad/
cp -v ~/.config/xmobar/* config/xmobar/

# dmenu
cp -v ~/.dmenu/* config/dmenu/

# nvim
cp -v ~/.config/nvim/init.vim config/nvim/
cp -v ~/.config/nvim/coc-settings.json config/nvim/

# fish
cp -v ~/.config/fish/config.fish config/fish/

# ranger
cp -v ~/.config/ranger/rc.conf config/ranger/
cp -v ~/.config/ranger/rifle.conf config/ranger/

