#!/usr/bin/bash
FILE="/tmp/screencopy"
wf-recorder -c png --file "file:$FILE.png" -g "$(slurp)" > /dev/null 2>&1
wl-copy -t image/png < "$FILE.png"
