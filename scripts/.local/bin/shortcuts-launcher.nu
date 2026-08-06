#!/usr/bin/env nu

# Requirements: fuzzel

let options = (cat ~/.config/sway/config | rg 'bindsym' | lines | each {|x| $x | str replace 'bindsym ' '' | str replace '\$mod' 'Super'})
$options | split row "," | str join "\n" | fuzzel --dmenu -p "Shortcuts:"
