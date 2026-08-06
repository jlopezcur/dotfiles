#!/usr/bin/env nu

# Sway session: compositor, bar, notifications, launcher, and the Wayland
# tools the sway config and the waybar modules call out to.
#
# workstyle is not here on purpose: it is installed with cargo, not pacman.

use common.nu *

const PACKAGES = [
    "sway" "swayidle" "swaylock" "uwsm"
    "waybar" "mako" "wofi" "fuzzel" "wob"
    "gammastep" "cliphist" "wl-clipboard"
    "grim" "slurp" "swappy" "wf-recorder"
    "wlr-randr" "wtype" "pamixer" "playerctl"
    "xdg-desktop-portal" "xdg-desktop-portal-wlr" "xdg-desktop-portal-gtk"
    "polkit-gnome" "gnome-keyring"
]

const STOW = [
    "sway" "waybar" "mako" "swaylock" "wofi" "fuzzel" "wob"
    "workstyle" "scripts" "xdg-mime"
]

def main [] {
    banner "🖥️" "Desktop"
    install $PACKAGES
    link $STOW
}
