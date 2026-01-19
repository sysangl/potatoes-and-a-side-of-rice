#!/bin/bash

rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/theme-select.rasi"
IFS=$'\n' read -r -d '' -a ricelist < <( ls -1 ./Rices/ && printf '\0')
for ricename in ${ricelist[@]}
do
    echo -en "$A""${cacheDir}"/"$A\n"
done
$rofi_command
theme_selection=$(IFS=$'\n' read -r -d '' -a ricelist < <( ls -1 ./Rices/ && printf '\0');for ricename in ${ricelist[@]};do echo -en "$A""${cacheDir}"/"$A\n"; done | $rofi_command)