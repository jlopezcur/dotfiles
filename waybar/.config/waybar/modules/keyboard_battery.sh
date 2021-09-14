#!/bin/sh

check=$(upower -i /org/freedesktop/UPower/devices/keyboard_hid_dco2co26oeeo2do69_battery | rg battery-level | awk '{print $2}')

if [[ $check = "unknown" ]]; then
  pct="--"
else
  pct=$(upower -i /org/freedesktop/UPower/devices/keyboard_hid_dco2co26oeeo2do69_battery | rg percentage | awk '{print $2}')
fi

printf '{"text":"%s", "class":"one", "alt":"one", "tooltip":"%s"}\n' \
    "$pct" "Keyboard battery: $pct" | jq --unbuffered --compact-output

