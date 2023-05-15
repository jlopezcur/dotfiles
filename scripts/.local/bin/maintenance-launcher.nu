#!/usr/bin/env nu

# Requirements: wofi

let tools = [
  { text: "NVTOP: GPU Top", command: "nvtop" },
  { text: "HTOP: Interactive process viewer", command: "htop" },
  { text: "TOP: Classical process viewer", command: "top" },
  { text: "BTOP: Tunned process viewer", command: "btop" },
  { text: "BMON: Monitoring bandwidth", command: "bmon" },
  { text: "List of explicit installed packages", command: "paru -Qe && input" },
  { text: "List of AUR explicit installed packages only", command: "paru -Qem" },
  { text: "Upgrade firmware", command: "firm-update" },
  { text: "GPing google.com", command: "gping google.com" },
  { text: "Internal IP", command: "ip route" },
  { text: "External IP", command: "curl -s https://icanhazip.com" },
  { text: "Update Clamav: update antivirus", command: "sudo freshclam" },
  { text: "Clamscan /home/jlopez/", command: "clamscan --recursive --infected /home/jlopez" },
  { text: "rkhunter: check for rootkits", command: "sudo rkhunter --check --sk" },
  { text: "Diskonaut: Disk space navigator", command: "diskonaut" },
  { text: "GDU: Disk usage analyzer", command: "gdu" },
  { text: "hwinfo", command: "hwinfo" },
  { text: "iftop", command: "sudo iftop" },
  { text: "kmon: kernel monitor", command: "sudo kmon" },
]
let text = ($tools | get text | str join "\n" | wofi -i --show dmenu -p "Maintenance command...")

if ($text | is-empty) { exit 0 }

if $text in $tools.text {
  let command = ($tools | where text == $text | get command | first)
  alacritty -e $command
} else {
  notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid command '($text)'"
  exit 1
}
