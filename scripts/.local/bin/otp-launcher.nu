#!/usr/bin/env nu

# Requirements: wofi

let key = (gopass ls -f | rg otp | wofi -i --show dmenu -p "OTP...")

if (not ($key | is-empty)) {
  ^gopass otp -c $key
}
