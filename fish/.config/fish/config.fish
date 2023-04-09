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
  set -gx DELTA_FEATURES +side-by-side
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

  # nnn
  source $HOME/.config/fish/nnn.fish

  # Bun
  set -Ux BUN_INSTALL "/home/jlopez/.bun"
  set -px --path PATH "/home/jlopez/.bun/bin"

  # volta
  set -gx VOLTA_HOME "$HOME/.volta"
  set -gx PATH "$VOLTA_HOME/bin" $PATH

  # zoxide
  zoxide init fish | source

  # the fuck
  thefuck --alias | source
end

status --is-login; and status --is-interactive; and exec byobu-launcher
