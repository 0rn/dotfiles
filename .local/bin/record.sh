#!/usr/bin/bash
# make sure to use 'kill' that supports 'SIGINT'
#swaynag -m 'Recording' -z 'Stop' "/bin/kill -SIGINT $$" &
#https://gist.github.com/0rn/53ddb97a17a2aeb433818d48818f257f
easytray.py "screenrecord" "media-record" -q "Stop Recording" "/bin/kill -SIGINT $$" &
exec wf-recorder $@ --force-yuv --file "file:$(xdg-user-dir VIDEOS)/$(date +'%Y-%m-%d:%H:%M:%S').mp4" -g "$(slurp)" > /dev/null 2>&1
