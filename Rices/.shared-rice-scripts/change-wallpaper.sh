#!/bin/bash
sleep 0.1
directory=~/.config/hypr/wallpapers/


if [ -z "$1" ]; then
    if [ -d "$directory" ]; then
        random_background=$(ls $directory/*.jpg | shuf -n 1)
        swww img --transition-type any $random_background
        rm ~/.config/rofi/.current_wallpaper
        cp $random_background ~/.config/rofi/.current_wallpaper
    fi
else
    
    swww img --transition-type any "$directory/$1"
    rm ~/.config/rofi/.current_wallpaper
    cp "$directory/$1" ~/.config/rofi/.current_wallpaper
fi
