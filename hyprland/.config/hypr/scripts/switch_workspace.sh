#!/bin/bash
# Get the ID of the focused monitor
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')

# If the monitor is the secondary monitor, add 10 to the workspace number
if [ "$MONITOR" == "DP-1" ]; then
    hyprctl dispatch workspace $1
elif [ "$MONITOR" == "DP-3" ]; then
    hyprctl dispatch workspace $(( $1 + 10 ))
elif [ "$MONITOR" == "eDP-1" ]; then
    hyprctl dispatch workspace $(( $1 + 20 ))
else
    hyprctl dispatch workspace $(( $1 + 30 ))
fi
