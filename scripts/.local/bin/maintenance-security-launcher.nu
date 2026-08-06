#!/usr/bin/env nu

# Requirements: fuzzel

let commands = {
  "Audit": { || kitty ~/.local/bin/commands/lynis.nu },
  "Virus scanner": { || kitty ~/.local/bin/commands/lynis.nu },
  "List of explicit installed packages": { || paru -Qe ; input },
  "List of AUR explicit installed packages only": { || paru -Qem },
  "Check for rootkits": { || sudo rkhunter --check --sk },
  "Upgrade firmware": { || kitty ~/.local/bin/firm-update.nu },
}

let text = ($commands | columns | str join "\n" | fuzzel --dmenu -p "Command...")

if ($text | is-empty) { exit 0 }

if not ($text in ($commands | columns) ) {
  notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid command '($text)'"
  exit 1
}

do ($commands | get $text)
