#!/bin/bash
LAYOUT_PATH=/tmp/fcitx_layout.txt
# get value from layout file
if [ -f $LAYOUT_PATH ]; then
    export FCITX_LAYOUT=`cat $LAYOUT_PATH`
else
    FCITX_LAYOUT=0
    echo $FCITX_LAYOUT > /tmp/fcitx_layout.txt
fi

if [[ $FCITX_LAYOUT -eq 0 ]]; then
    FCITX_LAYOUT=1
    echo $FCITX_LAYOUT > /tmp/fcitx_layout.txt
    fcitx-remote -s fcitx-keyboard-de
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout DE"
elif [[ $FCITX_LAYOUT -eq 1 ]]; then
    FCITX_LAYOUT=2
    echo $FCITX_LAYOUT > /tmp/fcitx_layout.txt
    fcitx-remote -s googlepinyin
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout CH"
else
    FCITX_LAYOUT=0
    echo $FCITX_LAYOUT > /tmp/fcitx_layout.txt
    fcitx-remote -s fcitx-keyboard-us
    dunstify -t 1000 -i "input-keyboard" -r 1234 -u normal "Keyboard layout US"
fi
