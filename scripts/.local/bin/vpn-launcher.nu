#!/usr/bin/env nu

# Requirements: wofi & vpns file
# vpns file is a list of valid VPNs session name, each name on one line

let vpn = (cat ~/.config/vpns | append "Check\n" | append "Stop all!" | str join "" | wofi -i --show dmenu -p "VPN Selection...")

if ($vpn | is-empty) { exit 0 }

match $vpn {
  "Check" => {
    kitty -e vpn-check.nu
    exit 0
  },
  "Stop all!" => {
    openvpn3 sessions-list
    | lines
    | str trim -l
    | filter {|x| $x | str starts-with 'Path' }
    | str substring 6..
    | each {|x| openvpn3 session-manage -D -o $x }
    exit 0
  },
}

let options = "Start,Pause,Resume,Restart,Stop"
let action = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "VPN Action...")

if ($action | is-empty) { exit 0 }

match $action {
  "Start" => {
    openvpn3 session-start -c $vpn
    notify-send -i /usr/share/icons/Arc/status/32/info.png "VPN Start" $"Started VPN '($vpn)'"
  },
  "Pause" => {
    openvpn3 session-manage -P -c $vpn
    notify-send -i /usr/share/icons/Arc/status/32/info.png "VPN Pause" $"Paused VPN '($vpn)'"
  },
  "Resume" => {
    openvpn3 session-manage -R -c $vpn
    notify-send -i /usr/share/icons/Arc/status/32/info.png "VPN Resume" $"Resumed VPN '($vpn)'"
  },
  "Restart" => {
    openvpn3 session-manage --restart -c $vpn
    notify-send -i /usr/share/icons/Arc/status/32/info.png "VPN Restart" $"Restarted VPN '($vpn)'"
  },
  "Stop" => { openvpn3 session-manage -D -c $vpn  },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid action '($action)'"
    exit 1
  }
}
