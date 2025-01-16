#!/usr/bin/env sh

if [ "$INFO" == "" ]; then LABEL="$(osascript -e 'output volume of (get volume settings)')%"; else LABEL="$INFO%"; fi

sketchybar --set $NAME label="$LABEL"
