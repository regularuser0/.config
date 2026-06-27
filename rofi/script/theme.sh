#!/bin/sh

#NAME=$(ls ~/images/selected_walls/ | cut -d. -f1 | rofi -dmenu -theme .config/rofi/stylewall.rasi)
#NAME=$(for a in /home/user/images/selected_walls/*; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -show-icons)
#NAME=$(for a in ~/images/selected_walls/*; do echo -en "$(basename "$a")\0icon\x1f$a\n"; done | rofi -dmenu -show-icons -theme ~/.config/rofi/stylewall.rasi)

NAME=$(for a in ~/images/selected_walls/*; do 
    filename=$(basename "$a")
    name_no_ext="${filename%.*}"
    echo -en "$name_no_ext\0icon\x1f$a\n"
done | rofi -dmenu -show-icons -theme ~/.config/rofi/stylewall.rasi)


extension=$(find ~/images/selected_walls/ -name "$NAME*" | cut -d. -f2-)

if [ -n "$NAME" ]; then

    wallpaper_path=~/images/selected_walls/$NAME.$extension

    rm /home/user/.config/script/theme/*

    echo $wallpaper_path > /home/user/.config/script/theme/last_wallpaper_path

    magick $wallpaper_path -define jpg:extent=1MB /home/user/.config/script/theme/current.jpg
    mv /home/user/.config/script/theme/current-0.jpg /home/user/.config/script/theme/current.jpg 
    
    swww img --transition-type wave "$wallpaper_path"

    wallust run "$wallpaper_path"

    pkill waybar && hyprctl dispatch exec waybar
    pkill dunst  && hyprctl dispatch exec dunst

fi
