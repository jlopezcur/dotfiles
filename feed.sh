#!/bin/bash

# ------------------------------------------------------------------------------
# Feed the configutarion files of the repo with the system ones
# ------------------------------------------------------------------------------

# URxvt
cp -v ~/.Xresources urxvt/

# i3
cp -v ~/.config/i3/config i3/

# i3status
cp -v ~/.config/i3status/config i3status/

# vim
cp -v ~/.config/vim/vimrc vim/
cp -Rv ~/.config/vim/autoload/plug.vim vim/autoload/

# fish
cp -v ~/.config/fish/config.fish fish/

# rofi
cp -Rv ~/.config/rofi/* rofi/

