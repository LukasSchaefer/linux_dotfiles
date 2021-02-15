#!/bin/bash
SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
# check if Focusrite interface used or not
if [[ "$SOURCE_NAME" == *"Focusrite_Scarlett_2i2"* ]]; then
    # change sound to built-in speaker
    pacmd set-default-sink 4
elif [[ "$SOURCE_NAME" == *"pci-0000"* ]]; then
    # change sound to audio interface
    pacmd set-default-sink 5
else
    # change sound to built-in speaker
    pacmd set-default-sink 4
fi
