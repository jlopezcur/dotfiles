#!/bin/sh

# Requirements: gopass & bemenu

key="$(gopass ls -f | rg otp | wofi -i --show dmenu -p 'OTP...')"
[ -n ${key} ] && gopass otp -c $key
