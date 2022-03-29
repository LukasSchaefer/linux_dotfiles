#!/bin/bash
SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
NUM_SOURCES=$(pacmd list-sinks | grep "index:" | tail -1 | grep -Eo '[0-9]+$')

CHANGED=0

while [[ $CHANGED -ne 1 ]]
do
    # check if Focusrite interface used or not
    if [[ "$SOURCE_NAME" == *"Focusrite_Scarlett_2i2"* ]]; then
        # change sound to Schiit Modi
        TARGET_NAME="Schiit_Audio_USB_Modi"
    elif [[ "$SOURCE_NAME" == *"Schiit_Audio_USB_Modi"* ]]; then
        # change sound to built-in speaker
        TARGET_NAME="pci-0000"
    elif [[ "$SOURCE_NAME" == *"pci-0000"* ]]; then
        # change sound to audio interface
        TARGET_NAME="Focusrite_Scarlett_2i2"
    else
        # default otherwise change sound to built-in speaker
        TARGET_NAME="pci-0000"
    fi
    echo "Find sink for $TARGET_NAME"

    for i in $(seq 0 $NUM_SOURCES);
    do
        OUTPUT=$(pacmd set-default-sink $i)
        SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
        if [[ "$SOURCE_NAME" == *"$TARGET_NAME"* ]]; then
            echo "Found at sink $i: $OUTPUT"
            CHANGED=1
            break
        fi
    done
    SOURCE_NAME=TARGET_NAME
done
