#!/bin/sh

# Requirements: wofi

list="NVTOP: GPU Top
HTOP: Interactive process viewer
TOP: Classical process viewer
BTOP: Tunned process viewer
paru -Qe: list of explicit installed packages
Upgrade firmware
GPing google.com
Internal IP
External IP"
action=$(echo "${list}" | wofi -i --show dmenu -p "Maintenance command...")

case $action in
  "NVTOP: GPU Top") alacritty -e nvtop ;;
  "HTOP: Interactive process viewer") alacritty -e htop ;;
  "TOP: Classical process viewer") alacritty -e top ;;
  "BTOP: Tunned process viewer") alacritty -e btop ;;
  "paru -Qe: list of explicit installed packages") alacritty -e paru -Qe ;;
  "Upgrade firmware") alacritty -e firm-update ;;
  "GPing google.com") alacritty -e gping google.com ;;
  "Internal IP") alacritty -e ip route ;;
  "External IP") alacritty -e curl -s https://icanhazip.com ;;
  *) echo "Invalid option $action" ;;
esac
