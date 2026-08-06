#!/usr/bin/env nu

use ../fns/pause

print "> Internal IP"
ip route

print "> External IP"
curl -s https://icanhazip.com
pause
