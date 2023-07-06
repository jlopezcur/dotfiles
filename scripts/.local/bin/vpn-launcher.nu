#!/usr/bin/env nu

# Requirements: wofi & vpns file
# vpns file is a list of valid VPNs session name, each name on one line

let vpn = (cat ~/.config/vpns | wofi -i --show dmenu -p "VPN Selection...")

if ($vpn | is-empty) { exit 0 }

let options = "Start,Check,Stop"
let action = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "VPN Action...")

if ($action | is-empty) { exit 0 }

match $action {
  "Start" => { openvpn3 session-start -c $vpn },
  "Check" => {
    alacritty -e vpn-check.nu
  },
  "Stop" => { openvpn3 session-manage -D -c $vpn  },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
