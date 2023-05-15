#!/usr/bin/env nu

# Requirements: cliphist & wofi & wl-clipboard

let entry = (cliphist list | wofi -i --show dmenu --width 800 -p "Clipboard...")

if ($entry | is-empty) { exit 0 }

let decoded_entry = ($entry | cliphist decode)

wl-copy -p $decoded_entry
wl-copy $decoded_entry
