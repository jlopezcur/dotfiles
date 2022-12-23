#!/bin/sh

# Requirements: wofi

list=" lock
 logout
 hibernate
 reboot
⏻ poweroff
 firmware upgrade"
action=$(echo "${list}" | wofi -i --show dmenu -p "System command...")

case $action in
  " lock") swaylock ;;
  " logout") swaymsg exit ;;
  " hibernate") systemctl hibernate ;;
  " reboot") systemctl reboot ;;
  "⏻ poweroff") systemctl poweroff ;;
  " firmware upgrade") alacritty -e firm-update ;;
  *) echo "Invalid option $action" ;;
esac
