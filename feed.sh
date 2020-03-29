#!/bin/bash

# ------------------------------------------------------------------------------
# Feed the configutarion files of the repo with the system ones
# ------------------------------------------------------------------------------

# URxvt
cp -v ~/.Xresources config/urxvt/

# i3
cp -v ~/.config/i3/config config/i3/

# polybar
cp -v ~/.config/polybar/* config/polybar/

# nvim
cp -v ~/.config/nvim/init.vim config/nvim/
cp -Rv ~/.config/nvim/coc-settings.json config/nvim/

# fish
cp -v ~/.config/fish/config.fish config/fish/

# rofi
cp -Rv ~/.config/rofi/* config/rofi/

# ranger
cp -v ~/.config/ranger/rc.conf config/ranger/
cp -v ~/.config/ranger/rifle.conf config/ranger/

