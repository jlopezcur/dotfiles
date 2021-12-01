#!/usr/bin/env python

import json
from datetime import datetime
import pytz

timezones = [
    {"title": "Madrid", "tz": "Europe/Madrid"},
    {"title": "Los Angeles", "tz": "America/Los_Angeles"},
    {"title": "New York", "tz": "America/New_York"},
    {"title": "Tokyo", "tz": "Asia/Tokyo"}
]
fmt = "%H:%M"


def parseTimezone(item):
    dst = pytz.timezone(item["tz"])
    return "<b>" + datetime.now(dst).strftime(fmt) + "</b> " + item["title"]


text = datetime.now().strftime(fmt)
tooltip = "\n".join(map(parseTimezone, timezones))

data = {}
data['text'] = text
data['class'] = "times"
data['tooltip'] = tooltip

print(json.dumps(data))
