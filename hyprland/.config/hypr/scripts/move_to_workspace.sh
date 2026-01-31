#!/bin/bash
# Get the ID of the focused monitor
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')

# If the monitor is the secondary monitor, add 10 to the workspace number
if [ "$MONITOR" == "DP-1" ]; then
    hyprctl dispatch movetoworkspacesilent $(( $1 + 10 ))
else
    hyprctl dispatch movetoworkspacesilent $1
fi
