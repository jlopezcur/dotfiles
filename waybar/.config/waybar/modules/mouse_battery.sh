#!/bin/sh

check=$(upower -i /org/freedesktop/UPower/devices/mouse_dev_EE_A4_C7_FA_04_BA | rg battery-level | awk '{print $2}')

if [[ $check = "unknown" ]]; then
  pct="--"
else
  pct=$(upower -i /org/freedesktop/UPower/devices/mouse_dev_EE_A4_C7_FA_04_BA | grep percentage | awk '{print $2}')
fi

printf '{"text":"%s", "class":"one", "alt":"one", "tooltip":"%s"}\n' \
    "$pct" "Mouse battery: $pct" | jq --unbuffered --compact-output

