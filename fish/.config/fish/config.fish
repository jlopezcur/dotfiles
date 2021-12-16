#
#  _____________
# < config.fish >
#  -------------
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

# Set default programs
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="qutebrowser"
export PAGER="less"
export MANPAGER="nvim -c 'set ft=man' -"

# Eye Candy
# https://wiki.archlinux.org/title/Color_output_in_console
export LESS='-R --use-color -Dd+r$Du+b'

# Set general architecture flags
export ARCHFLAGS="-arch x86_64"

# Source other files

[ -f ~/.config/fish/aliases.fish ] && . ~/.config/fish/aliases.fish

# Starship

starship init fish | source

# Check for a .nvmrc file and use it for change node version
function __check_nvmrc --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return
  if test -f .nvmrc
    nvm use || nvm install
  end
end
