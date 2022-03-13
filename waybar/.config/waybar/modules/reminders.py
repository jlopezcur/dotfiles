#!/usr/bin/env python

import json
import subprocess

events = subprocess.check_output(
    "remind -h $HOME/.reminders",
    shell=True,
    universal_newlines=True)

data = {}
data['text'] = "nope"
data['class'] = "reminders"
data['tooltip'] = events

print(json.dumps(data))
