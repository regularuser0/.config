#!/bin/sh

wall_path=$(cat /home/user/.config/script/theme/last_wallpaper_path)
OldName=$(basename $wall_path | cut -d. -f1)
Extension=$(basename $wall_path | cut -d. -f2-)

NewName=$(echo "$OldName" | rofi -dmenu -theme .config/rofi/stylewallname.rasi)

#todo add and delete tags
#explain commands with an image and show the actual wall with a style.rasi

if [ -n "$NewName" ]; then
    
    if [ "$NewName" == "/rm" ]; then
	mv $wall_path /home/user/Trash/
    else
	mv $wall_path /home/user/images/selected_walls/$NewName.$Extension
    fi

fi
