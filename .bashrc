#  _________
# < .bashrc >
#  ---------
#       \                    / \  //\
#        \    |\___/|      /   \//  \\
#             /0  0  \__  /    //  | \ \
#            /     /  \/_/    //   |  \  \
#            @_^_@'/   \/_   //    |   \   \
#            //_^_/     \/_ //     |    \    \
#         ( //) |        \///      |     \     \
#       ( / /) _|_ /   )  //       |      \     _\
#     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
#   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
#  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
#  (( /// ))      `.   {            }                   /      \  \
#   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
#              ///.----..>        \             _ -~             `.  ^-`  ^-_
#                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
#                                                                   /.-~

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# fzf
# https://github.com/junegunn/fzf
# ------------------------------------------------------------------------------

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
source ~/.fzf/shell/completion.bash

# nvm
# https://github.com/nvm-sh/nvm
# ------------------------------------------------------------------------------

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Only add to path for speed (if nvm itself is needed then uncomment upper
# lines)
PATH=~/.nvm/versions/node/v12.16.3/bin:$PATH

# ------------------------------------------------------------------------------

export EDITOR="nvim"
export ARCHFLAGS="-arch x86_64"

# key speed
xset r rate 300 50

# set keyboard layout
setxkbmap -layout es

# startx
# ------------------------------------------------------------------------------

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 exec startx
fi

# bash git prompt
# https://github.com/magicmonty/bash-git-prompt
# ------------------------------------------------------------------------------

if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ]; then
   # To only show the git prompt in or under a repository directory
   # GIT_PROMPT_ONLY_IN_REPO=1
   # To use upstream's default theme
   # GIT_PROMPT_THEME=Default
   # To use upstream's default theme, modified by arch maintainer
   # GIT_PROMPT_THEME=Default_Arch
   GIT_PROMPT_THEME=Solarized
   source /usr/lib/bash-git-prompt/gitprompt.sh
fi

# Aliases
# ------------------------------------------------------------------------------

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_work_aliases ]] && . ~/.bash_work_aliases

# Use the current path in the window name
# ------------------------------------------------------------------------------

case ${TERM} in
  alacritty)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s\007" "${PWD/#$HOME/\~}"'
    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s\033\\" "${PWD/#$HOME/\~}"'
    ;;
esac

# ------------------------------------------------------------------------------

# autocd on dirs
shopt -s autocd

# check on every command the size to adjust
shopt -s checkwinsize

# Complete command names and file names
complete -cf sudo
