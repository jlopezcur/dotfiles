#!/bin/sh

# Requirements: skim

actions=(
  "lock"
  "hibernate"
  "reboot"
  "poweroff"
)

action=$(printf "\n%s" "${actions[@]}" | sk --reverse --prompt="System: ")

case $action in
  "lock") lock ;;
  "hibernate") systemctl hibernate ;;
  "reboot") systemctl reboot ;;
  "poweroff") systemctl poweroff ;;
  *) echo "Invalid option $action" ;;
esac
