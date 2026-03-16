#!/bin/bash

TOUCHPAD="pixa3848:00-093a:3848-touchpad"
STATE_FILE="/tmp/touchpad_state"

# If state file doesn't exist, assume it's currently ON (0)
if [ ! -f "$STATE_FILE" ]; then
    echo "on" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "on" ]; then
    hyprctl keyword "device[$TOUCHPAD]:enabled" false > /dev/null
    echo "off" > "$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "Disabled 󰟙"
else
    hyprctl keyword "device[$TOUCHPAD]:enabled" true > /dev/null
    echo "on" > "$STATE_FILE"
    notify-send -u low -t 2000 "Touchpad" "Enabled 󰟜"
fi
