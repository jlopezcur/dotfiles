#!/bin/sh

text=$(date +'%a, %d/%m/%Y')

events="$(calcurse -Q --output-datefmt %d/%m/%Y | sed ':a; N; $!ba; s/\n/\r/g')"
calendar="$(cal -1 --color=always | sed ':a; N; $!ba; s/\n/\r/g')"
tooltip=$(echo "$calendar\n\n$events")

echo '{ "text": "'$text'", "class": "calendar", "tooltip": "'$tooltip'"}'
