set theme_color_scheme gruvbox
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set PATH ~/.cargo/bin:$PATH
set PATH ~/bin:$PATH
set PATH ~/.npm-global/bin:$PATH
set PATH /snap/bin:$PATH

alias lb "br -dp"
alias lv "br --sizes"

alias update "sudo apt update && sudo apt upgrade && sudo apt autoremove -y"
