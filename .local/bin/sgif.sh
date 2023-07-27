#!/usr/bin/bash
OUTDIR="$(xdg-user-dir PICTURES)"
FILENAME="$(date +%Y-%m-%d:%H:%M:%S)"
PALETTE="/tmp/palette.png"
#FILTERS="fps=15,scale=320:-1:flags=lanczos"

wf-recorder --file "file:/tmp/$FILENAME.mkv" -p quality=5 -c hevc_vaapi -d /dev/dri/renderD128 -g "$(slurp)"

#ffmpeg -i "file:/tmp/$FILENAME.mkv" -vf "$FILTERS,palettegen" -y $PALETTE
ffmpeg -i "file:/tmp/$FILENAME.mkv" -vf palettegen -y $PALETTE

#ffmpeg -i "file:/tmp/$FILENAME.mkv" -i $PALETTE -lavfi "$FILTERS [x]; [x][1:v] paletteuse=dither=none" -y "$OUTDIR/$FILENAME.gif"
ffmpeg -i "file:/tmp/$FILENAME.mkv" -i $PALETTE -lavfi "fps=15 [x]; [x][1:v] paletteuse=dither=none" -y "$OUTDIR/$FILENAME.gif"

rm "/tmp/$FILENAME.mkv"
