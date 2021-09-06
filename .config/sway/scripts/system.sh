#!/bin/sh

# Requirements: skim

actions=(
  "lock"
  "logout"
  "hibernate"
  "reboot"
  "poweroff"
  "update"
  "show updates"
  "idle"
)

action=$(printf "\n%s" "${actions[@]}" | sk --reverse --prompt="System: ")

case $action in
  "lock") swaylock ;;
  "logout") swaymsg exit ;;
  "hibernate") systemctl hibernate ;;
  "reboot") systemctl reboot ;;
  "poweroff") systemctl poweroff ;;
  "update") alacritty -e paru && pkill -SIGRTMIN+8 waybar ;;
  "show updates") update-show ;;
  "idle") inhibit-idle ;;
  *) echo "Invalid option $action" ;;
esac
