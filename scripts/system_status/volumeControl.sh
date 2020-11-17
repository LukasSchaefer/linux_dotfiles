#!/usr/bin/env bash

# You can call this script like this:
# $ ./volumeControl.sh up
# $ ./volumeControl.sh down
# $ ./volumeControl.sh mute

# Script modified from these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a
# pacmd commands from https://unix.stackexchange.com/questions/132230/read-out-pulseaudio-volume-from-commandline-i-want-pactl-get-sink-volume

function get_volume {
    pacmd list-sinks|grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g'
}

function is_mute {
    muted=$(pacmd list-sinks|grep -A 15 '* index'|awk '/muted:/{ print $2 }')
    if [ $muted == "no" ]; then
        false
    else
        true
    fi
}

function send_notification {
    iconSound="audio-volume-high"
    iconMuted="audio-volume-muted"

    if is_mute; then
        dunstify -t 1000 -i $iconMuted -r 2593 -u normal "mute"
    else
        volume=$(get_volume)
        # Make the bar with the special character ─ (it's not dash -)
        # https://en.wikipedia.org/wiki/Box-drawing_character
        bar=$(seq --separator="─" 0 "$((volume / 5))" | sed 's/[0-9]//g')
        # Send the notification
        dunstify -t 1000 -i $iconSound -r 2593 -u normal "$volume%"$'\n'"$bar"
    fi
}

case $1 in
  up)
    # set the volume on (if it was muted)
    amixer -q -D pulse set Master on > /dev/null
    # up the volume (+ 5%)
    amixer -q -D pulse sset Master 10%+ > /dev/null
    send_notification
    ;;
  down)
    amixer -q -D pulse set Master on > /dev/null
    amixer -q -D pulse sset Master 10%- > /dev/null
    send_notification
    ;;
  mute)
    # toggle mute
    amixer -q -D pulse set Master 1+ toggle > /dev/null
    send_notification
    ;;
esac
