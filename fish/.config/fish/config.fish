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
