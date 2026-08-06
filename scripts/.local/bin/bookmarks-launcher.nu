#!/usr/bin/env nu

# Requirements: qutebrowser & fuzzel

let bookmark = (cat .config/qutebrowser/bookmarks/urls | fuzzel --dmenu -p "Select a bookmark..." -w 80)
let link = ($bookmark | split column " " | get column1)
wl-copy -p $link
wl-copy $link
notify-send "Link copied!" $link -u normal -i color

