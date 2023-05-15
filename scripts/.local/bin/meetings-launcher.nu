#!/usr/bin/env nu

# Requirements: thorium-browser & wofi & meetings file
# Meetings file is located at ~/.config/meetings
# Each line is a meeting, has two columns separated by comma: the name and the
# link: f.e:
# First meetings,http://example1...
# Second meetings,http://example2...

let meetings = (cat ~/.config/meetings | lines | parse '{name},{link}')
let meet_name = ($meetings | get name | str join "\n" | wofi -i --show dmenu -p "Select meet...")

if ($meet_name | is-empty) { exit 0 }

let filtered = ($meetings | filter {|x| $x.name == $meet_name})

if (($filtered | length) == 0) { exit 0 }

let meet_link = ($filtered | get link | get 0)

thorium-browser $meet_link
