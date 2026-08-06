#!/usr/bin/env nu

# Requirements: gopass & fuzzel

let key = (gopass ls -f | fuzzel --dmenu -p 'Passwords...')

if (not ($key | is-empty)) {
  gopass -c $key
}
