#!/bin/sh

FILE=$(ls ~/sav/output_wall | rofi -dmenu -theme .config/rofi/stylewall.rasi)

if [ -n "$FILE" ]; then

    wallpaper_path=~/sav/output_wall/$FILE

    rm /home/user/.config/script/theme/*

    echo $wallpaper_path > /home/user/.config/script/theme/last_wallpaper_path

    magick $wallpaper_path -define jpg:extent=1MB /home/user/.config/script/theme/current.jpg

    swww img --transition-type wave "$wallpaper_path"

    wallust run "$wallpaper_path"

    pkill waybar && hyprctl dispatch exec waybar
    pkill dunst  && hyprctl dispatch exec dunst

fi
