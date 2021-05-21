#!/bin/sh

# Requirements: skim

actions=(
  "screenshot"
  "screenshot (partial)"
  "video"
  "video (partial)"
  "gif (partial)"
)

action=$(printf "\n%s" "${actions[@]}" | sk --reverse --prompt="Capture: ")

case $action in
  "screenshot") cd ~/images && grim ;;
  "screenshot (partial)") grim -g "$(slurp)" -o "~/images/capture.png" ;;
  "video") create-video ;;
  "video (partial)") create-video ;;
  "gif (partial)") create-gif ;;
  *) echo "Invalid option $action" ;;
esac

