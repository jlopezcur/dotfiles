#!/bin/sh

# Requirements: gopass, skim & wl-clipboard

key="$(gopass ls -f | sk --reverse --prompt='Pass: ')"
pass="$(gopass show $key)"
echo $pass
sleep 1
nohup wl-copy "$pass"
disown
