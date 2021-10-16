#!/bin/sh

# Requirements: gopass & bemenu

key="$(gopass ls -f | rg otp | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'OTP')"
[ -n ${key} ] && gopass otp -c $key
