#!/usr/bin/env nu

# Requirements: cliphist & fuzzel & wl-clipboard

let entry = (cliphist list | fuzzel --dmenu -w 100 -p "Clipboard...")

if ($entry | is-empty) { exit 0 }

let decoded_entry = ($entry | cliphist decode)

wl-copy -p $decoded_entry
wl-copy $decoded_entry
