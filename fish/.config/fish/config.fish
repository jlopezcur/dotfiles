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

if status is-interactive
  # default applications
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  set -gx TERMINAL alacritty
  set -gx TERMCMD alacritty
  set -gx BROWSER qutebrowser
  set -gx PAGER less
  set -gx READER zathura
  # set -gx MANPAGER nvim

  # Eye Candy
  # https://wiki.archlinux.org/title/Color_output_in_console
  set -gx LESS -R --use-color -Dd+r$Du+b

  # Set general architecture flags
  set -gx ARCHFLAGS -arch x86_64

  # Source other files
  [ -f ~/.config/fish/aliases.fish ] && . ~/.config/fish/aliases.fish

  # Starship
  starship init fish | source

  # nvm
  source $HOME/.config/fish/nvm.fish

  # nnn
  source $HOME/.config/fish/nnn.fish
end
