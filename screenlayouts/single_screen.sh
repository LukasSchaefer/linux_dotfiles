#!/bin/sh
EDP=$(xrandr -q | grep "eDP" | awk '{ print $1 }')
xrandr --output $EDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-1-1 --off --output DP-1-1-2 --off --output DP-1-1-3 --off
