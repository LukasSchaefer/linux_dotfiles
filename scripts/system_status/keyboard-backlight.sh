#!/usr/bin/env bash
# rotate keyboard brightness
# constant increment to increase level by
BACKLIGHT_INC=1

function get_backlight {
    brightnessctl --device='dell::kbd_backlight' g
}

function get_max_backlight {
    brightnessctl --device='dell::kbd_backlight' m
}

BACKLIGHT=$(get_backlight)
BACKLIGHT_MAX=$(get_max_backlight)

function send_notification {
    icon="notification-keyboard-brightness"
    backlight=$(get_backlight)
    max_backlight=$(get_max_backlight)
    backlight_per=$(($backlight * 100 / $max_backlight))
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" 0 $((backlight_per / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -t 1000 -i "$icon" -r 5555 -u normal "$backlight_per%"$'\n'"$bar"
}

BACKLIGHT=$(($BACKLIGHT + BACKLIGHT_INC))
if [[ $BACKLIGHT -gt $BACKLIGHT_MAX ]]; then
    BACKLIGHT=0
fi
sudo brightnessctl --device='dell::kbd_backlight' s $BACKLIGHT
send_notification
