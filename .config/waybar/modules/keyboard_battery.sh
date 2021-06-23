#!/bin/sh

pct=$(upower -i /org/freedesktop/UPower/devices/keyboard_hid_dco2co26oeeo2do69_battery | grep percentage | awk '{print $2}')

printf '{"text":"%s", "class":"one", "alt":"one", "tooltip":"%s"}\n' \
    "$pct" "Keyboard battery: $pct" | jq --unbuffered --compact-output

