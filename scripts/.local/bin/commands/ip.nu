#!/usr/bin/env nu

use ../../lib/nu/pause

print "> Internal IP"
ip route

print "> External IP"
curl -s https://icanhazip.com
pause
