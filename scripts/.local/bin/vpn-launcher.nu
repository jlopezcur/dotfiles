#!/usr/bin/env nu

# Requirements: wofi

let options = "DEVO"
let vpn = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "VPN Selection...")

if ($vpn | is-empty) { exit 0 }

let options = "Start,Check,Stop"
let action = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "VPN Action...")

if ($action | is-empty) { exit 0 }

match $action {
  "Start" => { openvpn3 session-start -c $vpn },
  "Check" => { dialog --erase-on-exit --msgbox (openvpn3 sessions-list) 30 81 },
  "Stop" => { openvpn3 session-manage -D -c $vpn  },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
