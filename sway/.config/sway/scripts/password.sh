#!/bin/sh

# Requirements: gopass & bemenu

key="$(gopass ls -f | wofi -i --show dmenu -p 'Passwords...')"
[ -n ${key} ] && gopass -c $key
