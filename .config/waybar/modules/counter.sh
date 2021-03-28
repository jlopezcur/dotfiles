#!/bin/sh

list=$(cat)

if [[ $list = "" ]]; then
  printf '{"text":"", "class":"none", "alt":"none", "tooltip":""}\n'
  exit
fi

count=$(echo "$list" | wc -l)
plainlist="$(echo "$list" | sed ':a; N; $!ba; s/\n/\\n/g')"

if [[ "$count" -eq 0 ]]; then
  class="none"
elif [[ "$count" -eq 1 ]]; then
  class="one"
elif [[ "$count" -gt 1 ]]; then
  class="many"
else
  class="unknown"
fi

printf '{"text":"%s", "class":"%s", "alt":"%s", "tooltip":"%s"}\n' \
    "$count" "$class" "$class" "$plainlist" | jq --unbuffered --compact-output
