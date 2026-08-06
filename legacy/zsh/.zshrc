source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen theme sindresorhus/pure

antigen bundle git
antigen bundle npm
antigen bundle archlinux
antigen bundle vi-mode
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# User configuration

export UPDATE_ZSH_DAYS=1
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR='nvim'
export ARCHFLAGS="-arch x86_64"

alias vpn-devo="cd ~/.ssh/vpn/devo/ && ./connect.sh"
alias myip='curl http://ipecho.net/plain; echo'

# key speed
xset r rate 300 50

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# startx
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 exec startx
fi
