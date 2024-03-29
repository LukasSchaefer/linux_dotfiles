#!/bin/bash
SOURCE_NAME=$(pacmd info | grep "Default sink name" | head -1 | awk '{print $4}')
# check if Focusrite interface used or not
if [[ "$SOURCE_NAME" == *"Focusrite_Scarlett_2i2"* ]]; then
    echo " (S)"
elif [[ "$SOURCE_NAME" == *"Schiit_Audio_USB_Modi"* ]]; then
    echo " (M)"
elif [[ "$SOURCE_NAME" == *"pci-0000"* ]]; then
    echo ""
else
    echo "?"
fi
