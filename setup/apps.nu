#!/usr/bin/env nu

# Everyday applications: files, mail, feeds, media, documents, browsers.

use common.nu *

const PACKAGES = [
    "yazi" "btop" "calcurse"
    "neomutt" "isync" "newsboat"
    "mpv" "imv" "sxiv" "ncmpcpp" "mpd" "mpc"
    "zathura" "zathura-pdf-mupdf" "zathura-cb" "zathura-ps" "pdfarranger"
    "qutebrowser" "nyxt" "chromium"
    "helix" "tmux" "zellij" "termshark"
]

const AUR_PACKAGES = ["thorium-browser-bin" "slack-desktop-wayland"]

const STOW = [
    "btop" "calcurse" "neomutt" "isync" "newsboat"
    "mpv" "ncmpcpp" "sxiv" "zathura" "pdfarranger"
    "qutebrowser" "nyxt" "chromium" "slack"
    "helix" "tmux" "zellij" "termshark" "tig" "lua"
]

def main [] {
    banner "📦" "Applications"
    install $PACKAGES
    install-aur $AUR_PACKAGES
    link $STOW
}
