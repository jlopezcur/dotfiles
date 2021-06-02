#!/bin/sh

# Requirements: skim

actions=(
  "screenshot"
  "screenshot (partial)"
  "video"
  "video (partial)"
  "gif (partial)"
  "color (hex)"
)

action=$(printf "\n%s" "${actions[@]}" | sk --reverse --prompt="Capture: ")

case $action in
  "screenshot") cd ~/images && grim ;;
  "screenshot (partial)") grim -g "$(slurp)" -o "~/images/capture.png" ;;
  "video") create-video ;;
  "video (partial)") create-video ;;
  "gif (partial)") create-gif ;;
  "color (hex)") grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4 | wl-copy ;;
  *) echo "Invalid option $action" ;;
esac

