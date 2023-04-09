#!/bin/bash

DIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing from $DIR..."

stow -vt ~ "$DIR/nushell"          # Shell
stow -vt ~ "$DIR/starship"         # Makeup for shell & much more
stow -vt ~ "$DIR/git"              # Git
stow -vt ~ "$DIR/sway"             # Window manager
stow -vt ~ "$DIR/waybar"           # System bar
stow -vt ~ "$DIR/mako"             # Notifications
stow -vt ~ "$DIR/swaylock"         # Locker
stow -vt ~ "$DIR/alacritty"        # Terminal
stow -vt ~ "$DIR/qutebrowser"      # Primary browsers
stow -vt ~ "$DIR/brave"            # Second browser
stow -vt ~ "$DIR/chromium"         # Third browser
stow -vt ~ "$DIR/newsboat"         # Newsboat
stow -vt ~ "$DIR/zathura"          # PDF Reader
stow -vt ~ "$DIR/slack"            # Slack
stow -vt ~ "$DIR/scrcpy"           # Mobile viewer
stow -vt ~ "$DIR/btop"             # Process monitor
stow -vt ~ "$DIR/neomutt"          # Email client
stow -vt ~ "$DIR/scripts"          # Custom scripts
stow -vt ~ "$DIR/castero"          # Castero
stow -vt ~ "$DIR/sxiv"             # Image viewer
stow -vt ~ "$DIR/termshark"        # Packet analyzer
stow -vt ~ "$DIR/calcurse"         # Calendar manager
stow -vt ~ "$DIR/weechat"          # IRC

echo "DONE!"
