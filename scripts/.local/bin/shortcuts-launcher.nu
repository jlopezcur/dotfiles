#!/usr/bin/env nu

# Requirements: wofi

let options = (cat ~/.config/sway/config | rg 'bindsym' | lines | each {|x| $x | str replace 'bindsym ' '' | str replace '\$mod' 'Super'})
$options | split row "," | str join "\n" | wofi -i --show dmenu -p "Shortcuts:"
