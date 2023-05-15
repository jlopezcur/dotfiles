#!/usr/bin/env nu

# Requirements: wofi

let options = "M1,M2"
let meet = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Select meet...")

if ($meet | is-empty) { exit 0 }

match $meet {
  "M1" => { thorium-browser "https://meet.google.com/zeq-jjyd-kek" },
  "M2" => { thorium-browser "https://meet.google.com/vob-ytao-mfo" },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid meet '($meet)'"
    exit 1
  }
}
