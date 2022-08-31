#!/bin/sh

# Requirements: gopass & wofi

key="$(gopass ls -f | rg otp | wofi -i --show dmenu -p 'OTP...')"
[ -n ${key} ] && gopass otp -c $key
