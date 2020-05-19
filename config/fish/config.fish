set theme_color_scheme gruvbox
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set PATH ~/.cargo/bin:$PATH
set PATH ~/bin:$PATH
set PATH ~/.npm-global/bin:$PATH

alias lb "br -dp"
alias lv "br --sizes"

alias update "sudo apt update && sudo apt upgrade && sudo apt autoremove -y"
alias vifm "~/.config/vifm/scripts/vifmrun"

alias vpn-devo "cd ~/.ssh/vpn/devo/ && ./connect.sh"

# Use Vi key bindings as default
fish_vi_key_bindings

# Remove motd
set fish_greeting

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
