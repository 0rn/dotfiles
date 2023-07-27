#!/usr/bin/bash
FILE="$(xdg-user-dir PICTURES)/$(date +%Y-%m-%d:%H:%M:%S)"
wf-recorder -c png --file "file:$FILE.png" -g "$(slurp)" > /dev/null 2>&1
