#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness {
    brightnessctl g
}

function get_max_brightness {
    brightnessctl m
}

function send_notification {
    icon="notification-display-brightness"
    brightness=$(get_brightness)
    max_brightness=$(get_max_brightness)
    brightness_value=$(($brightness * 100 / $max_brightness))
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" 0 $((brightness_value / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -t 1000 -i "$icon" -r 5432 -u normal "$brightness_value%"$'\n'"$bar"
}

case $1 in
  up)
    # increase the backlight by 10%
    brightnessctl s +10%
    send_notification
    ;;
  down)
    # decrease the backlight by 10%
    brightnessctl s 10%-
    send_notification
    ;;
esac
