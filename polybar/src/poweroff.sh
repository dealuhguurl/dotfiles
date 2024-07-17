#!/bin/bash
 
selected=$(echo "Shutdown
Restart" | rofi -dmenu -p "Power Options")
 
if [ "$selected" == "Shutdown" ]
then
   poweroff 
elif [ "$selected" == "Restart" ]
then
    reboot
else
    exit
fi

