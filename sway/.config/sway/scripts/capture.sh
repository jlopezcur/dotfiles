#!/bin/sh

# Requirements: bemenu

actions=(
  "screen"
  "video"
  "gif"
  "color"
)

list=$(printf "\n%s" "${actions[@]}") # list of entries in lines
list="${list:1}" # remove the first separator
action=$(echo "${list}" | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'Capture')

export GRIM_DEFAULT_DIR="$HOME/images/"

case $action in
  "screen") grim -g "$(slurp)" ;;
  "video")
    subaction=$(echo -e "mute\naudio" | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'Capture Video')
    case $subaction in
      "mute") record-screen ;;
      "audio") record-screen --audio ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  "gif") record-gif ;;
  "color")
    subaction=$(echo -e "hex\nrgb" | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'Capture Color')
    case $subaction in
      "hex") capture-color --hex ;;
      "rgb") capture-color --rgb ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  *) echo "Invalid option $action" ;;
esac

