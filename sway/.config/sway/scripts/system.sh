#!/bin/sh

# Requirements: wofi

list=" lock
 logout
 hibernate
 reboot
⏻ poweroff"
action=$(echo "${list}" | wofi -i --show dmenu -p "System command...")

case $action in
  " lock") swaylock ;;
  " logout") swaymsg exit ;;
  " hibernate") systemctl hibernate ;;
  " reboot") systemctl reboot ;;
  "⏻ poweroff") systemctl poweroff ;;
  *) echo "Invalid option $action" ;;
esac
