#!/usr/bin/env nu

let process_id = (pidof ncmpcpp)
if ($process_id | is-empty) {
  alacritty --class ncmpcpp -e ncmpcpp
} else {
  let visibility = ((swaymsg -t get_tree | jq '..|objects|select(.app_id=="ncmpcpp")|.visible') == "true")
  swaymsg "scratchpad show"

  # rotate two times because I dont have more than two diferent scratchpads
  if (not $visibility) {
    let visibility = ((swaymsg -t get_tree | jq '..|objects|select(.app_id=="ncmpcpp")|.visible') == "true")
    if (not $visibility) { swaymsg "scratchpad show" }
  }
}
