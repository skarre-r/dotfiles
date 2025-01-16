#!/usr/bin/env sh

AC_POWER=$(pmset -g batt | grep 'AC Power')

if [[ $AC_POWER != "" ]]; then
    ICON="􀋦"
else
    ICON="􀺶"
fi

sketchybar --set $NAME label="$(pmset -g batt | grep -Eo '[[:digit:]]+%' | cut -d% -f1)%" icon="$ICON"
