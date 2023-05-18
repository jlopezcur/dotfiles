#!/usr/bin/env nu

# Based on archey3
# https://lclarkmichalek.github.io/archey3/

let os = (uname -o) # GNU/Linux
let machine = (uname -m) # x86_64
let hostname = (hostname)
let kernel = (uname -r) # 6.3.1
let uptime = (uptime -p)
let packages = (paru -Q | wc -l)
let packages_exp = (paru -Qe | wc -l)
let packages_exp_aur = (paru -Qem | wc -l)
let ram = (free -h --si | rg Mem | str replace -a " +" " " | parse "Mem: {total} {used} {free} {shared} {buff_cache} {available}")
let ram_used = ($ram.used | get 0)
let ram_total = ($ram.total | get 0)
let processor = (cat /proc/cpuinfo | rg 'model name' | ^uniq | str replace -a "model name\t: " "")
let disk = (df -h / | rg '/' | str replace -a " +" " " | parse "{drive} {size} {used} {available} {used_pct} {mount_point}")
let disk_used = ($disk.used | get 0)
let disk_size = ($disk.size | get 0)
let disk_used_pct = ($disk.used_pct | get 0)

let logo = [
  "               +                ",
  "               #                ",
  "              ###               ",
  "             #####              ",
  "             ######             ",
  "            ; #####;            ",
  "           +##.#####            ",
  "          +##########           ",
  "         #############;         ",
  "        ###############+        ",
  "       #######   #######        ",
  "     .######;     ;######.      ",
  "    .#######;     ;#######.     ",
  "    #########.   .#########.    ",
  "   ######'           '######    ",
  "  ;####                 ####;   ",
  "  ##'                     '##   ",
  " #'                         \'# ",
]

let logo_in_color = ($logo | each {|x| $x | $"(ansi blue)($x)(ansi reset)" })

let info = [
  $"(ansi blue)OS:(ansi reset) ($os) ($machine)",
  $"(ansi blue)Hostname:(ansi reset) ($hostname)",
  $"(ansi blue)Kernel Release:(ansi reset) ($kernel)",
  $"(ansi blue)Uptime:(ansi reset) ($uptime)",
  $"(ansi blue)Shell:(ansi reset) ($env.SHELL)",
  $"(ansi blue)Packages:(ansi reset) ($packages)/($packages_exp)\(EXP\)/($packages_exp_aur)\(AUR\)",
  $"(ansi blue)RAM:(ansi reset) (ansi yellow)($ram_used)(ansi reset) / ($ram_total)",
  $"(ansi blue)Processor Type:(ansi reset) ($processor)",
  $"(ansi blue)Root:(ansi reset) (ansi yellow)($disk_used)(ansi reset) / ($disk_size) \(($disk_used_pct)\)",
  $"(ansi blue)\$EDITOR:(ansi reset) ($env.EDITOR)",
  $"(ansi blue)\$BROWSER:(ansi reset) ($env.BROWSER)",
  $"(ansi blue)Alt Browser:(ansi reset) qutebrowser",
  $"(ansi blue)Terminal:(ansi reset) alacritty",
  $"(ansi blue)Font:(ansi reset) FiraCode Nerd Font",
  $"(ansi blue)WM:(ansi reset) Sway",
  $"(ansi blue)Bar:(ansi reset) Waybar",
  $"(ansi blue)Player:(ansi reset) MPV / (ansi blue)PDF:(ansi reset) Zathura",
]
let info_len = ($info | length)

let mixed = ($logo_in_color | enumerate | each {|x| $x.item + (if $x.index < $info_len { ($info | get $x.index) } else { "" }) })

echo ($mixed | prepend "" | append "\n" | str join "\n")
