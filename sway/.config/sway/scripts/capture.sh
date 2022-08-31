#!/bin/sh

# Requirements: wofi

actions=(
  "screen"
  "video"
  "gif"
  "color"
)

list=$(printf "\n%s" "${actions[@]}") # list of entries in lines
list="${list:1}" # remove the first separator
action=$(echo "${list}" | wofi -i --show dmenu -p "Capture command...")

export GRIM_DEFAULT_DIR="$HOME/images/"

case $action in
  "screen") grim -g "$(slurp)" ;;
  "video")
    subaction=$(echo -e "mute\naudio" | wofi -i --show dmenu -p "Capture video command...")
    case $subaction in
      "mute") record-screen ;;
      "audio") record-screen --audio ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  "gif") record-gif ;;
  "color")
    subaction=$(echo -e "hex\nrgb" | wofi -i --show dmenu -p "Capture color command...")
    case $subaction in
      "hex") capture-color --hex ;;
      "rgb") capture-color --rgb ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  *) echo "Invalid option $action" ;;
esac

