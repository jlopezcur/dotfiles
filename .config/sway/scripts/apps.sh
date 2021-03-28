#!/bin/sh

# Requirements: skim

apps=(
  "alacritty -e bmon"
  "alacritty -e bpytop"
  "alacritty -e castero"
  "alacritty -e cointop"
  "alacritty -e glances"
  "alacritty -e iftop"
  "alacritty -e lf"
  "alacritty -e newsboat"
  "alacritty -e nload"
  "alacritty -e nnn"
  "alacritty -e nvim"
  "alacritty -e sxiv"
  "alacritty -e vimiv"
  "audacity"
  "brave"
  "celestia"
  "chromium"
  "elinks"
  "firefox"
  "gimp"
  "godot"
  "grafx2"
  "inkscape"
  "librewolf"
  "lxappearance"
  "obs"
  "pavucontrol"
  "qutebrowser"
  "slack"
  "steam"
  "telegram-desktop"
  "zathura"
)

# APP="$(compgen -c | sort -u | sk --reverse --prompt='Run: ')"
app=$(printf "\n%s" "${apps[@]}" | sk --reverse --prompt="Run: ")

if [[ $app = "" ]]; then
  exit
fi

swaymsg -t command exec "$app"
