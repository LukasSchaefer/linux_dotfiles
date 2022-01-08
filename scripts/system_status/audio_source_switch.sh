#!/bin/bash
SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
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

i=0
while [[ "$SOURCE_NAME" != *$TARGET_NAME* ]]
do
    pacmd set-default-sink $i
    SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
    echo "$i: $SOURCE_NAME --> $TARGET_NAME"
    i=$[$i+1]
done
