#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    DP_connected="none"
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ $m != "eDP"* ]] ; then
            echo $m
            DP_connected=$m
        fi
    done
    if [ "$DP_connected" != "none" ]; then
        echo "Start polybar on eDP-1-1 and $DP_connected"
        polybar $DP_connected &
        polybar eDP-1 &
    else
        polybar --reload master &
    fi
else
    polybar --reload master &
fi

echo "Polybar launched..."
