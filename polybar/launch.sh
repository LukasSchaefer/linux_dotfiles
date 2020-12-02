#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    DP13_connected=false
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ "$m" = "DP-1-3" ]; then
            DP13_connected=true
        fi
    done
    if [ "$DP13_connected" = true ]; then
        polybar eDP11 &
        polybar DP13 &
    else
        polybar --reload master &
    fi
else
    polybar --reload master &
fi

echo "Polybar launched..."
