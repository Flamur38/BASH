#!/bin/bash

# Get volume and mute status using pactl
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [[ "$mute" == "yes" ]]; then
    echo "VOL Muted"
else
    echo "VOL $volume"
fi

