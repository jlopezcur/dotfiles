#!/usr/bin/env nu

use ../fns/pause

sudo freshclam
clamscan --recursive --infected $env.HOME
pause
