alias ...='cd ...'
alias ....='cd ....'


alias ls='exa'
alias l='exa -alh --icons'
alias cat='bat'
alias find='fd'
alias ps='procs'
alias ping='gping'
alias v='nvim'

alias myip='curl http://ipecho.net/plain; echo'
alias update-system='yay && yay -Yc && nvim +PlugUpdate +PlugUpgrade +TSUpdate'

# Git

alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gst='git status'

alias gco='git checkout'
alias gcm='git checkout master'
alias gcd='git checkout develop'

alias gb='git branch'
# view remote branches
alias gbr='git branch --remote'

alias gup='git pull --rebase'
alias gp='git push'
# push a newly created local branch to origin
alias gpsup='git push --set-upstream origin $(git_current_branch)'
