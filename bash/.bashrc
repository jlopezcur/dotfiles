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

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

# nvm
# https://github.com/nvm-sh/nvm
# ------------------------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR"/nvm.sh --no-use
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR"/bash_completion
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
   export GIT_PROMPT_THEME=Solarized
   . /usr/lib/bash-git-prompt/gitprompt.sh
fi

# Aliases
# ------------------------------------------------------------------------------

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bashrc_private ] && . ~/.bashrc_private

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

# History

HISTFILESIZE=5000000
HISTSIZE=10000
shopt -s histappend
HISTCONTROL=ignoreboth

# ------------------------------------------------------------------------------

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(starship init bash)"
