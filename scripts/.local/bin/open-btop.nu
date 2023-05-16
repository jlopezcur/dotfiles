#!/usr/bin/env nu

let process_id = (pidof btop)
if ($process_id | is-empty) {
  alacritty --class btop -e btop
} else {
  let visibility = ((swaymsg -t get_tree | jq '..|objects|select(.app_id=="btop")|.visible') == "true")
  swaymsg "scratchpad show"

  # rotate two times because I dont have more than two diferent scratchpads
  if (not $visibility) {
    let visibility = ((swaymsg -t get_tree | jq '..|objects|select(.app_id=="btop")|.visible') == "true")
    if (not $visibility) { swaymsg "scratchpad show" }
  }
}
