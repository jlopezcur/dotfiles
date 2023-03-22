#!/bin/sh

# Partialy based on: https://github.com/mhdzli/dotfiles/blob/master/src/.local/bin/wayrecord
# Requirements: wofi

action=$(printf "📷 screen\n🎥 video\n🖼️ gif\n💧 color" | wofi -i --show dmenu -p "Capture command...")

list_geometry () {
    append=
    [ "$2" = with_description ] && append="\t\(.name)"
    swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.'"$1"' and .pid) | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)'$append'"'
}

FOCUSED=$(list_geometry focused)
FILENAME="$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"
IMAGE_DIR="$HOME/images/"

case $action in
  "📷 screen")
    subaction=$(printf "fullscreen\nregion\nfocused" | wofi -i --show dmenu -p "Capture image command...")
    case $subaction in
      "fullscreen") grim "$IMAGE_DIR/pic-full-$FILENAME";;
      "region") grim -g "$(slurp)" "$IMAGE_DIR/pic-selected-$FILENAME";;
      "focused") grim -g "$FOCUSED" "$IMAGE_DIR/pic-focused-$FILENAME";;
    esac
    ;;
  "🎥 video")
    subaction=$(printf "mute\naudio" | wofi -i --show dmenu -p "Capture video command...")
    case $subaction in
      "mute") record-screen ;;
      "audio") record-screen --audio ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  "🖼️ gif") record-gif ;;
  "💧 color")
    subaction=$(printf "hex\nrgb" | wofi -i --show dmenu -p "Capture color command...")
    case $subaction in
      "hex") capture-color --hex ;;
      "rgb") capture-color --rgb ;;
      *) echo "Invalid suboption $subaction" ;;
    esac
    ;;
  *) echo "Invalid option $action" ;;
esac

