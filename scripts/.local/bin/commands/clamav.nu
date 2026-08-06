#!/usr/bin/env nu

use ../../lib/nu/pause

sudo freshclam
clamscan --recursive --infected $env.HOME
pause
