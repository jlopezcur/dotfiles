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
set EDITOR "nvim"
set VISUAL "nvim"
set BROWSER "brave"

# Set general architecture flags
set ARCHFLAGS "-arch x86_64"

# set keyboard layout
setxkbmap -layout es

# key speed
xset r rate 300 50

# Start X at login
if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end

# Source other files

[ -f ~/.config/fish/aliases.fish ] && . ~/.config/fish/aliases.fish
[ -f ~/.config/fish/config-private.fish ] && . ~/.config/fish/config-private.fish
