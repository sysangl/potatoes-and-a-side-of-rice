#!/bin/bash
WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", "");print}' | rofi -show window)
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow address:[addr]