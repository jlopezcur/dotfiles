#!/usr/bin/env nu

# Requirements: wofi

let options = "jlopezcur@gmail.com,jlopez2123@alumno.uned.es,javier.lopez@devo.com"
let account = ($options | split row "," | str join "\n" | wofi -i --show dmenu -p "Sync account...")

if ($account | is-empty) { exit 0 }

match $account {
  "jlopezcur@gmail.com" => { alacritty -e mbsync jlopezcur },
  "jlopez2123@alumno.uned.es" => { alacritty -e mbsync uned },
  "javier.lopez@devo.com" => { alacritty -e mbsync devo },
  _ => {
    notify-send -i /usr/share/icons/Arc/status/32/error.png "Error" $"Invalid account '($account)'"
    exit 1
  }
}
