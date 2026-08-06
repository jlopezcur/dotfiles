#!/bin/sh

# https://www.youtube.com/watch?v=YOpeXETS2z0&t=373s

mountable=$(lsblk -lp | rg "part $" | awk '{print $1, "(" $4 ")"}')
[ "$mountable" = "" ] && exit 1

chosen=$(echo "${mountable}" | fuzzel --dmenu -p "Mount which drive?") || exit 0
# sudo mount "$chosen" && exit 0

dirs=$(find /mnt /media /mount /home -type d -maxdepth 3 2>/dev/null)
mountpoint=$(echo "${dirs}" | fuzzel --dmenu -p "Mount point?")
[ "$mountpoint" = "" ] && exit 1

if [ ! -d "$mountpoint" ]; then
  mkdiryn=$(printf "No\nYes" | bemenu -i -H 25 --tf '#268bd2' --hf '#268bd2' -p "$mountpoint does not exists. Create it?")
  [ "$mkdiryn" = Yes ] && sudo mkdir -p "$mountpoint"
fi

sudo mount "$chosen" "$mountpoint" && notify-send "$chosen mounted to $mountpoint"
