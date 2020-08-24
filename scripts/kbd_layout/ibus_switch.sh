#!/bin/bash

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	ibus engine "pinyin"
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout CH"
elif [[ `ibus engine` == "pinyin" ]]; then
	ibus engine "xkb:de:nodeadkeys:ger"
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout DE"
else
    ibus engine "xkb:us::eng"
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout US"
fi
