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

# vim
cp -v ~/.config/vim/vimrc vim/
cp -Rv ~/.config/vim/autoload/plug.vim vim/autoload/

# fish
cp -v ~/.config/fish/config.fish fish/

# rofi
cp -Rv ~/.config/rofi/* rofi/

