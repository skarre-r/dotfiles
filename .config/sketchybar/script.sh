#!/usr/bin/env sh

case "$NAME" in
    "app")
        LABEL="$INFO"
        sketchybar --set "$NAME" label="$LABEL"
        ;;
    "battery")
        AC_POWER=$(pmset -g batt | grep 'AC Power')
        if [[ $AC_POWER != "" ]]; then ICON="􀋦"; else ICON="􀺶"; fi
        LABEL="$(pmset -g batt | grep -Eo '[[:digit:]]+%' | cut -d% -f1)%"
        sketchybar --set "$NAME" label="$LABEL" icon="$ICON"
        exit 0
        ;;
    "brightness")
        if [ "$INFO" == "" ]; then LABEL="00%"; else LABEL="$INFO%"; fi
        sketchybar --set "$NAME" label="$LABEL"
        exit 0
        ;;
    "date")
        LABEL="$(date '+%a %d %b')"
        sketchybar --set "$NAME" label="$LABEL"
        exit 0
        ;;
    "ip_address")
        LABEL=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
        if [ "$LABEL" == "" ]; then ICON=""; else ICON="􀤆"; fi
        sketchybar --set "$NAME" label="$LABEL" icon="$ICON"
        exit 0
        ;;
    "time")
        LABEL="$(date '+%H:%M')"
        sketchybar --set "$NAME" label="$LABEL"
        exit 0
        ;;
    "volume")
        if [ "$INFO" == "" ]; then LABEL="$(osascript -e 'output volume of (get volume settings)')%"; else LABEL="$INFO%"; fi
        sketchybar --set "$NAME" label="$LABEL"
        exit 0
        ;;
    "week")
        WEEK="$(date '+%V')"
        if [ $(echo $WEEK | cut -c1-1 ) == "0" ]; then WEEK=$(echo $WEEK | cut -c2-2); fi
        sketchybar --set "$NAME" label="Week $WEEK"
        exit 0
        ;;
    "wifi")
        if [ "$INFO" == "" ]; then SSID=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'); else SSID="$INFO"; fi
        if [ "$SSID" == "" ]; then LABEL="N/A"; else LABEL="$SSID"; fi
        if [ "$LABEL" == "" ]; then ICON="􀙈"; else ICON="􀙇"; fi
        sketchybar --set "$NAME" label="$(echo $LABEL | sed 's/\(.\{18\}\).*/\1.../')" icon="$ICON"
        exit 0
        ;;
    *)
        exit 0
        ;;
esac
