#!/usr/bin/env sh

if [ "$INFO" == "" ]; then SSID=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'); else SSID="$INFO"; fi
if [ "$SSID" == "" ]; then LABEL="N/A"; else LABEL="$SSID"; fi
if [ "$LABEL" == "" ]; then ICON="􀙈"; else ICON="􀙇"; fi

sketchybar --set $NAME label="$LABEL" icon="$ICON"
