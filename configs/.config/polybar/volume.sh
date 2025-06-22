#!/usr/bin/env bash

sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')
volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1)
muted=$(pactl get-sink-mute "$sink" | awk '{print $2}')

if [ "$muted" = "yes" ]; then
    echo "muted"
else
    echo "$volume"
fi
