#!/usr/bin/env python

import json
import subprocess
from datetime import datetime

fields = ["id", "priority", "project", "summary"]

output = subprocess.check_output("dstask show-open", shell=True, universal_newlines=True)
open_tasks = json.loads(output)
total_open_task = str(len(open_tasks))

def get_bigger_column_size(cols, new_columns):
    return list(map(lambda i: max(cols[i], new_columns[i]), [i for i in range(len(fields))]))

def get_task_column_sizes(task):
    return list(map(lambda x : len(str(task[x])), fields))

def get_column_sizes(items):
    column_sizes = list(map(lambda x : len(x), fields))
    for task_column_sizes in map(get_task_column_sizes, items):
        column_sizes = get_bigger_column_size(column_sizes, task_column_sizes)
    return column_sizes

column_sizes = get_column_sizes(open_tasks)

def get_table_header(fields, column_sizes):
    each = fields.copy()
    line = fields.copy()
    for i in range(len(fields)):
        each[i] = fields[i].ljust(column_sizes[i], ' ')
        line[i] = "".ljust(column_sizes[i], '-')

    return " | ".join(each) + "\n" + " | ".join(line)

table_header = get_table_header(fields, column_sizes)

def format_task(item):
    return " | ".join(map(lambda i : str(item[fields[i]]).ljust(column_sizes[i], ' '), range(len(fields))))

task_list = "\n".join(map(format_task, open_tasks))

tooltip = table_header + "\n" + task_list

data = {}
data['text'] = total_open_task
data['class'] = "tasks"
data['tooltip'] = tooltip

print(json.dumps(data))
