#!/usr/bin/env nu

# Requirements: wofi

let options = "Lock,Logout,Hibernate,Reboot,Poweroff"
let action = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "System command...")

if ($action | is-empty) { exit 0 }

match $action {
  "Lock" => { swaylock },
  "Logout" => { swaymsg exit },
  "Hibernate" => { systemctl hibernate },
  "Reboot" => { systemctl reboot },
  "Poweroff" => { systemctl poweroff },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
