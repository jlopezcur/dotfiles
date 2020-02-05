#!/bin/bash

# ------------------------------------------------------------------------------
# Feed the configutarion files of the repo with the system ones
# ------------------------------------------------------------------------------

# URxvt
cp -v ~/.Xresources urxvt/

# i3
cp -v ~/.config/i3/config i3/

# i3blocks
cp -v ~/.config/i3blocks/* i3blocks/

# nvim
cp -v ~/.config/nvim/init.vim nvim/
cp -Rv ~/.config/nvim/coc-settings.json nvim/

# fish
cp -v ~/.config/fish/config.fish fish/

# rofi
cp -Rv ~/.config/rofi/* rofi/

# ranger
cp -v ~/.config/ranger/rc.conf ranger/

