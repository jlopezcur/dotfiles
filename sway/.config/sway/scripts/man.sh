#!/bin/sh

# Requirements: skim

PAGE="$(apropos . | awk '{print $1}' | sk --reverse --prompt='Man page: ')"
swaymsg -t command exec "alacritty -e man $PAGE"
