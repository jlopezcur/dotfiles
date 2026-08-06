#!/usr/bin/env nu

# Requirements: fuzzel

let key = (gopass ls -f | rg otp | fuzzel --dmenu -p "OTP...")

if (not ($key | is-empty)) {
  ^gopass otp -c $key
}
