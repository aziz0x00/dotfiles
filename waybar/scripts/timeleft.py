#!/bin/python

from datetime import datetime, timedelta

now = datetime.now()

day_end = datetime(now.year, now.month, now.day) + timedelta(days=1)

h, m = str(day_end - now).split(":")[:2]

if int(h) > 16:
    print(f"{23-6-int(h)}:{m} till morning SLEEP!! ")
else:
    print(f"-{h}:{m} ")
