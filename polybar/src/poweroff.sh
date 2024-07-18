#!/bin/bash
 
selected=$(echo "Shutdown
Restart" | rofi -dmenu -theme "~/.config/rofi/theme.rasi" -p "Power Options")
 
if [ "$selected" == "Shutdown" ]
then
   poweroff 
elif [ "$selected" == "Restart" ]
then
    reboot
else
    exit
fi

