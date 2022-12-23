#!/bin/sh

# Requirements: wofi

list="start
check
stop"
action=$(echo "${list}" | wofi -i --show dmenu -p "VPN command...")

case $action in
  "start") vpn-start ;;
  "check") alacritty -e vpn-check ;;
  "stop") vpn-stop ;;
  *) echo "Invalid option $action" ;;
esac
