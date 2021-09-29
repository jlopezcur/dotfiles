#!/usr/bin/env python

import json
import subprocess
from datetime import datetime

calendar = subprocess.check_output("cal -3 -m --color=always", shell=True, universal_newlines=True)
events = subprocess.check_output("calcurse -Q --output-datefmt %d/%m/%Y", shell=True, universal_newlines=True)
text = datetime.now().strftime("%a, %d/%m/%Y")

calendar = calendar.replace("\u001b[7m", '<b><u>').replace("\u001b[27m", "</u></b>")

data = {}
data['text'] = text
data['class'] = "calendar"
data['tooltip'] = calendar + "\n" + events

print(json.dumps(data))
