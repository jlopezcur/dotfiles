#!/usr/bin/env nu

# Partialy based on: https://github.com/mhdzli/dotfiles/blob/master/src/.local/bin/wayrecord
# Requirements: wofi

let image_dir = $"($env.HOME)/images/"

def get_prefix [] {
  return (date now | format date "%Y-%m-%d-%Hh%Mm%Ss_")
}

let options = "Screen,Video,Gif,Color"
let action = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Capture command...")

if ($action | is-empty) { exit 0 }

match $action {
  "Screen" => {
    let options = "Fullscreen,Region,Focused"
    let subaction = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Capture image command...")
    if ($subaction | is-empty) { exit 0 }
    let filename = $"(get_prefix)screenshot.png"
    match $subaction {
      "Fullscreen" => {
        grim $"($image_dir)/pic-full-($filename)"
        notify-send "Screenshot" $"Saved screenshot on '($image_dir)($filename)'"
      },
      "Region" => {
        grim -g (slurp) $"($image_dir)/pic-selected-($filename)"
        notify-send "Screenshot" $"Saved screenshot on '($image_dir)($filename)'"
      },
      "Focused" => {
        let geometry = (swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(."focused" and .pid) | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)"')
        grim -g $geometry $"($image_dir)/pic-focused-($filename)"
        notify-send "Screenshot" $"Saved screenshot on '($image_dir)($filename)'"
      },
      _ => {
        notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid subaction '($subaction)'"
        exit 1
      }
    }
  },
  "Video" => {
    let options = "Mute,Audio"
    let subaction = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Capture video command...")
    if ($subaction | is-empty) { exit 0 }
    match $subaction {
      "Mute" => { record-screen },
      "Audio" => { record-screen --audio },
      _ => {
        notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid subaction '($subaction)'"
        exit 1
      }
    }
  },
  "Gif" => { record-gif },
  "Color" => {
    let options = "Hex,RGB"
    let subaction = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Capture color command...")
    if ($subaction | is-empty) { exit 0 }
    let formats = (grim -g (slurp -p) -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | split column " ")
    match $subaction {
      "Hex" => {
        let color = ($formats | get column4 | first)
        wl-copy -p $color
        wl-copy $color
        notify-send "Hexadecimal copied!" $color -u normal -i color
      },
      "RGB" => {
        let color = $"rgb($formats | get column2 | first)"
        wl-copy -p $color
        wl-copy $color
        notify-send "RGB copied!" $color -u normal -i color
      },
      _ => {
        notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid subaction '($subaction)'"
        exit 1
      }
    }
  },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
