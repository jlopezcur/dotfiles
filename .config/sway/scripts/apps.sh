#!/bin/sh

# Requirements: skim

apps=(
  "qutebrowser"
  "brave"
  "librewolf"
  "gimp"
  "inkscape"
  "godot"
  "steam"
  "grafx2"
  "audacity"
  "celestia"
  "chromium"
  "obs"
  "elinks"
  "firefox"
  "alacritty -e bpytop"
  "alacritty -e lf"
  "lxappearance"
  "alacritty -e nnn"
  "zathura"
  "pavucontrol"
  "slack"
  "alacritty -e sxiv"
  "telegram-desktop"
  "alacritty -e vimiv"
  "alacritty -e nvim"
  "alacritty -e cointop"
  "alacritty -e glances"
)

# APP="$(compgen -c | sort -u | sk --reverse --prompt='Run: ')"
app=$(printf "\n%s" "${apps[@]}" | sk --reverse --prompt="Run: ")

if [[ $app = "" ]]; then
  exit
fi

swaymsg -t command exec "$app"
