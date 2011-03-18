#!/usr/bin/env python
"""
Usage:

    git log next..master --oneline | milestones.py
    git cherry next master -v | milestones.py

Requirements:

    pip install termcolor

"""
import json
import re
import sys
import urllib

import termcolor

API = 'https://api-dev.bugzilla.mozilla.org/latest/bug/%s'
bug_re = re.compile('bug (\d+)', re.I)

# Create functions for all the colors and attributes.
for attr in termcolor.ATTRIBUTES:
    globals()[attr] = lambda x, a=attr: termcolor.colored(x, attrs=[a])
for color in termcolor.COLORS:
    globals()[color] = lambda x, c=color: termcolor.colored(x, c)


def milestone(bug):
    qs = '?include_fields=target_milestone'
    response = urllib.urlopen(API % bug + qs)
    return json.loads(response.read()).get('target_milestone')


def buggy(msg):
    return bug_re.sub(lambda x: bold(magenta(x.group(0))), msg)


for line in sys.stdin:
    diff, mcolor = '', green
    if line.startswith('+') or line.startswith('-'):
        mcolor = green if line.startswith('+') else red
        diff = mcolor(line[:2])
        line = line[2:]
    rev, msg = line.strip().split(' ', 1)
    bug = bug_re.findall(msg)
    ms = set(milestone(b) for b in bug)
    ms = '[%s]' % ', '.join(map(mcolor, ms)) if ms else ''
    print diff, bold(yellow(rev[:8])), buggy(msg), ms
