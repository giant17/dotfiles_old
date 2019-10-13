#!/usr/bin/python
# coding=utf-8

import sys
import os
import subprocess

uri = os.environ.get('QUERY_STRING')
referer = os.environ.get('HTTP_REFERER')

if not uri:
    print
    print "Error: No URI"
    sys.exit()


cmd_start = ("pgrep", "-x", "transmission-da", "||", "transmission-daemon")
cmd_list = ("transmission-remote", "-a", uri)
cmd_notify = ("notify-send", " Torrent added.", "-t", "1000")

subprocess.call(cmd_list)

if referer:
    print "HTTP/1.1 303 See Other"
    print "Location: %s" % referer

