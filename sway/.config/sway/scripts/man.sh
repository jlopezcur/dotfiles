#!/bin/sh

# Requirements: bemenu

page="$(apropos . | awk '{print $1}' | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'Man Page')"
[ -z "$page" ] || alacritty -e man $page
