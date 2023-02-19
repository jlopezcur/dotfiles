#!/bin/sh

# Requirements: wofi

list="NVTOP: GPU Top
HTOP: Interactive process viewer
TOP: Classical process viewer
BTOP: Tunned process viewer
BMON: Monitoring bandwidth
paru -Qe: list of explicit installed packages
Upgrade firmware
GPing google.com
Internal IP
External IP
Update Clamav: update antivirus
Clamscan /home/jlopez/
rkhunter: check for rootkits
Diskonaut: Disk space navigator
GDU: Disk usage analyzer
hwinfo
iftop
kmon: kernel monitor"
action=$(echo "${list}" | wofi -i --show dmenu -p "Maintenance command...")

case $action in
  "NVTOP: GPU Top") alacritty -e nvtop ;;
  "HTOP: Interactive process viewer") alacritty -e htop ;;
  "TOP: Classical process viewer") alacritty -e top ;;
  "BTOP: Tunned process viewer") alacritty -e btop ;;
  "BMON: Monitoring bandwidth") alacritty -e bmon ;;
  "paru -Qe: list of explicit installed packages") alacritty -e paru -Qe ;;
  "Upgrade firmware") alacritty -e firm-update ;;
  "GPing google.com") alacritty -e gping google.com ;;
  "Internal IP") alacritty -e ip route ;;
  "External IP") alacritty -e curl -s https://icanhazip.com ;;
  "Update Clamav: update antivirus") alacritty -e sudo freshclam ;;
  "Clamscan /home/jlopez/") alacritty -e clamscan --recursive --infected /home/jlopez/ ;;
  "rkhunter: check for rootkits") alacritty -e sudo rkhunter --check --sk ;;
  "Diskonaut: Disk space navigator") alacritty -e diskonaut ;;
  "GDU: Disk usage analyzer") alacritty -e gdu ;;
  "hwinfo") alacritty -e hwinfo ;;
  "iftop") alacritty -e sudo iftop ;;
  "kmon: kernel monitor") alacritty -e sudo kmon ;;
  *) echo "Invalid option $action" ;;
esac
