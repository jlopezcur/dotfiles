
export XDG_CONFIG_HOME="$HOME/.config"

# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

set theme_color_scheme gruvbox
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

