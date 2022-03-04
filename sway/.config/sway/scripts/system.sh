#!/bin/sh

# Requirements: bemenu

actions=(
  "lock"
  "logout"
  "hibernate"
  "reboot"
  "poweroff"
  "update"
  "check email"
  "check updates"
)

list=$(printf "\n%s" "${actions[@]}") # list of entries in lines
list="${list:1}" # remove the first separator
action=$(echo "${list}" | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p "System")

case $action in
  "lock") swaylock ;;
  "logout") swaymsg exit ;;
  "hibernate") systemctl hibernate ;;
  "reboot") systemctl reboot ;;
  "poweroff") systemctl poweroff ;;
  "update") alacritty -e system-update ;;
  "check email") mbsync gmail ;;
  "check updates") store-package-updates ;;
  *) echo "Invalid option $action" ;;
esac
