#!/usr/bin/env nu

# Requirements: fuzzel

let options = "Lock,Logout,Hibernate,Reboot,Poweroff"
let action = ($options | split row "," | str join "\n" | fuzzel --dmenu -p "System command...")

if ($action | is-empty) { exit 0 }

match $action {
  # "Lock" => { hyprlock },
  "Lock" => { swaylock },
  # "Logout" => { hyprctl exit },
  "Logout" => { swaynag -t warning -m 'Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit' },
  "Hibernate" => { systemctl hibernate },
  "Reboot" => { systemctl reboot },
  "Poweroff" => { systemctl poweroff },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
