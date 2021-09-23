#!/usr/bin/env python

import json
from datetime import datetime

emoji = "🚭"
per_day = 20
cost_per_day = 1
quit_date = datetime(2021, 8, 14, 21)

now = datetime.now()
delta = now - quit_date
elapsed_seconds = (delta.days * 24 * 60 * 60) + delta.seconds
day_in_seconds = (24 * 60 * 60)
total = (per_day * elapsed_seconds) / day_in_seconds
total_cost = (cost_per_day * elapsed_seconds) / day_in_seconds

data = {}
data['text'] = str(int(round(total, 0))) + " " + emoji + " " + str(round(total_cost, 2)) + "€"
data['class'] = "quit"
data['tooltip'] = "Nothing yet"

print(json.dumps(data))
