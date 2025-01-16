#!/usr/bin/env sh

if [ "$INFO" == "" ]; then LABEL="??"; else LABEL="$INFO %"; fi

sketchybar --set $NAME label=$LABEL
