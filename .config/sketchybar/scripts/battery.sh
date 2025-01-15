#!/usr/bin/env sh

sketchybar --set $NAME label="$(pmset -g batt | grep -Eo '[[:digit:]]+%' | cut -d% -f1)%"
