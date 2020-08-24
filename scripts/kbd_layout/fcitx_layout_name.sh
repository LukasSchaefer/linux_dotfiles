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
	echo "US"
elif [[ $FCITX_LAYOUT -eq 1 ]]; then
	echo "DE"
else
    echo "CH"
fi
