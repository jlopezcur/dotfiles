#!/bin/sh

text=$(date +'%a, %d/%m/%Y')

list=$(calcurse -Q)
plainlist="$(echo "$list" | sed ':a; N; $!ba; s/\n/\\n/g')"

calendar=$(cal -3 --color=never)
plaincalendar="$(echo "$calendar" | sed ':a; N; $!ba; s/\n/\\n/g')"

tooltip=$(echo "$plaincalendar\n$plainlist")

printf '{"text":"%s", "class":"one", "alt":"one", "tooltip":"%s"}\n' \
    "$text" "$tooltip" | jq --unbuffered --compact-output

