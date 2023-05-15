#!/usr/bin/env nu

# Requirements: gopass & wofi

let key = (gopass ls -f | wofi -i --show dmenu -p 'Passwords...')

if (not ($key | is-empty)) {
  gopass -c $key
}
