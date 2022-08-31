#!/bin/sh

# Requirements: gopass & wofi

key="$(gopass ls -f | wofi -i --show dmenu -p 'Passwords...')"
[ -n ${key} ] && gopass -c $key
