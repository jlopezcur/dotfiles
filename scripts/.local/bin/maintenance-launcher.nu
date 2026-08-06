#!/usr/bin/env nu

# Requirements: wofi

let commands = {
  "Security": { || maintenance-security-launcher.nu },
  "Monitor": { || maintenance-monitor-launcher.nu },
  "Disk": { || maintenance-disk-launcher.nu },
  "Information": { || maintenance-info-launcher.nu },
}

let text = ($commands | columns | str join "\n" | wofi -i --show dmenu -p "Command...")

if ($text | is-empty) { exit 0 }

if not ($text in ($commands | columns) ) {
  notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid command '($text)'"
  exit 1
}

do ($commands | get $text)
