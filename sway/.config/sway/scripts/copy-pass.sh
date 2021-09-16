#!/bin/sh

# Requirements: gopass, skim & wl-clipboard

key="$(gopass ls -f | sk --reverse --prompt='Pass: ')"
pass="$(gopass -o $key)"
nohup wl-copy "$pass"
disown
