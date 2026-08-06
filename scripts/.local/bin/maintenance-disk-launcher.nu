#!/usr/bin/env nu

# Requirements: fuzzel

let commands = {
  "GDU: Disk usage analyzer": { || kitty gdu },
  "Diskonaut: Disk space navigator": { || kitty diskonaut },
}

let text = ($commands | columns | str join "\n" | fuzzel --dmenu -p "Command...")

if ($text | is-empty) { exit 0 }

if not ($text in ($commands | columns) ) {
  notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid command '($text)'"
  exit 1
}

do ($commands | get $text)
