#!/bin/sh

# Requirements: gopass & bemenu

key="$(gopass ls -f | bemenu -H 25 --tf '#268bd2' --hf '#268bd2' -p 'Password')"
[ -n ${key} ] && gopass -c $key
