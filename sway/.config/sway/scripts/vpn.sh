#!/bin/sh

# Requirements: bemenu

actions=(
  "start"
  "check"
  "stop"
)

list=$(printf "\n%s" "${actions[@]}") # list of entries in lines
list="${list:1}" # remove the first separator
action=$(echo "${list}" | wofi -i --show dmenu -p "VPN command...")

case $action in
  "start") vpn-start ;;
  "check") alacritty -e vpn-check ;;
  "stop") vpn-stop ;;
  *) echo "Invalid option $action" ;;
esac
