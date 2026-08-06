#!/usr/bin/env nu

# Requirements: fuzzel

let commands = {
  "NVTOP: GPU Top": { || do (nu -c $"($env.term) nvtop") },
  "HTOP: Interactive process viewer": { || do (nu -c $"($env.term) htop") },
  "TOP: Classical process viewer": { || top },
  "BTOP: Tunned process viewer": { || btop },
  "BMON: Bandwidth monitoring": { || bmon },
  "IFTOP: Network monitoring": { || sudo iftop },
  "KMON: kernel monitor": { || sudo kmon },
}

let text = ($commands | columns | str join "\n" | fuzzel --dmenu -p "Command...")

if ($text | is-empty) { exit 0 }

if not ($text in ($commands | columns) ) {
  notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid command '($text)'"
  exit 1
}

do ($commands | get $text)
