#!/bin/sh

# Requirements: gopass, skim & wl-clipboard

key="$(gopass ls -f | sk --reverse --prompt='Pass: ')"
pass="$(gopass show $key)"
nohup wl-copy "$pass"
disown
