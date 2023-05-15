#!/usr/bin/env nu

# Requirements: wofi & mbsync & accounts file
# Accounts file is located at ~/.config/mail_accounts
# Each line is an account, has two columns separated by comma: the email and the
# account: f.e:
# example@gmail.com,example
# second.example@gmail.com,second

let accounts = (cat ~/.config/mail_accounts | lines | parse '{email},{account}')
let account_name = ($accounts | get email | str join "\n" | wofi -i --show dmenu -p "Sync account...")

if ($account_name | is-empty) { exit 0 }

let filtered = ($accounts | filter {|x| $x.email == $account_name})

if (($filtered | length) == 0) { exit 0 }

let account_key = ($filtered | get account | get 0)

notify-send "Syncing..." $"Syncing account '($account_name): ($account_key)'"
mbsync jlopezcur
notify-send "Synced!" $"Synces account '($account_name): ($account_key)'!"
