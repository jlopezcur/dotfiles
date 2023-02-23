#
#  ______________
# < aliases.fish >
#  --------------
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

abbr -a -g l ls -alh --icons
abbr -a -g vim nvim

alias myip "curl http://ipecho.net/plain; echo"
alias ls "exa"
alias cat "bat"
alias ps "procs"
alias ping "gping"
alias v "nvim --startuptime /tmp/nvim-startuptime"
alias hx "helix"
alias open "xdg-open"
alias cheat "tldr"
alias du "dust"
alias fzf "sk"
abbr -a -g ... ../..
abbr -a -g .... ../../..
abbr -a -g ..... ../../../..

# Git

abbr -a -g ga git add
abbr -a -g gc git commit -v
abbr -a -g gd git diff
abbr -a -g gst git status

abbr -a -g gco git checkout
abbr -a -g gcm git checkout master
abbr -a -g gcd git checkout develop

abbr -a -g gb git branch
# view remote branches
abbr -a -g gbr git branch --remote

abbr -a -g gup git pull --rebase
abbr -a -g gp git push
# push a newly created local branch to origin
abbr -a -g gpsup 'git push --set-upstream origin (git_current_branch)'

# Poweroff, Reboot, ...

abbr -a -g reboot systemctl reboot
abbr -a -g poweroff systemctl poweroff
abbr -a -g suspend systemctl suspend
abbr -a -g hibernate systemctl hibernate

# Eye Candy
# https://wiki.archlinux.org/title/Color_output_in_console
alias diff "diff --color=auto"
alias grep "grep --color=auto"
alias ip "ip -color=auto"
