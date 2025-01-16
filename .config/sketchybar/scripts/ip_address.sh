#!/usr/bin/env sh

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)

if [ "$IP_ADDRESS" == "" ]; then
    LABEL=""
    ICON=""
else
    LABEL="$IP_ADDRESS"
    ICON="􀤆"
fi

sketchybar --set $NAME label="$LABEL" icon="$ICON"
