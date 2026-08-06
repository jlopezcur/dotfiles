#!/usr/bin/env nu

# Shell, prompt, terminal and the CLI tools the config assumes are present.

use common.nu *

const PACKAGES = [
    "nushell" "starship" "kitty" "stow"
    "git" "git-delta" "tig"
    "zoxide" "fzf" "eza" "bat" "ripgrep" "fd" "procs"
]

const AUR_PACKAGES = ["carapace-bin"]

const STOW = ["nushell" "starship" "kitty" "git" "bash" "stow"]

def main [] {
    banner "🐚" "Shell"
    install $PACKAGES
    install-aur $AUR_PACKAGES
    link $STOW
}
