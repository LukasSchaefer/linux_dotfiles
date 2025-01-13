#!/bin/bash
DP_connected="none"
eDP_connected="none"
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ $m != "eDP"* ]] ; then
        DP_connected=$m
    else
        eDP_connected=$m
    fi
done
if [ "$DP_connected" != "none" ]; then
    echo "Internal screen at $eDP_connected"
    echo "Found connected screen at $DP_connected with resolution $DP_resolution"
    xrandr --output $eDP_connected --primary --mode 1920x1200 --pos 0x0 --rotate normal --output $DP_connected --same-as $eDP_connected
else
    echo "No external screens found"
    xrandr --output $eDP_connected --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off
fi
