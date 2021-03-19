#!/bin/sh

# Requirements: gopass, skim & wl-clipboard

KEY="$(gopass ls -f | sk --reverse --prompt='Pass: ')"
gopass show $KEY | wl-copy -p
