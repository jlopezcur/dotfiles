#!/usr/bin/env nu

# Requirements: wofi

let bookmark = (cat .config/qutebrowser/bookmarks/urls | wofi -i --show dmenu -p "Select a bookmark..." --width 80%)
let link = ($bookmark | split column " " | get column1)
wl-copy -p $link
wl-copy $link
notify-send "Link copied!" $link -u normal -i color

