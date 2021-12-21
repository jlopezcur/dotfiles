#!/usr/bin/env python

import json
from os.path import expanduser, isfile
import sys

home = expanduser("~")

count_file_path = home + "/.cache/package-updates.count"
list_file_path = home + "/.cache/package-updates.list"

text = ""
if (isfile(count_file_path)):
    count_file = open(count_file_path, "r")
    text = count_file.readline().replace("\n", "")
    count_file.close()

tooltip = ""
if (isfile(list_file_path)):
    list_file = open(list_file_path, "r")
    tooltip = "".join(list_file.readlines())[:-1]
    list_file.close()

data = {}
data['text'] = text
data['class'] = "updates"
data['tooltip'] = tooltip

print(json.dumps(data))
