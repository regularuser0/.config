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
	echo "removed" > /home/user/.config/script/theme/last_wallpaper_path
	~/.config/script/theme.sh
    elif [ "$Extension" == "webp" ]; then
	magick $wall_path /home/user/images/selected_walls/$NewName.png
	rm $wall_path
	echo "/home/user/images/selected_walls/$NewName.png" > /home/user/.config/script/theme/last_wallpaper_path
    else
	mv $wall_path /home/user/images/selected_walls/$NewName.$Extension
	echo "/home/user/images/selected_walls/$NewName.$Extension" > /home/user/.config/script/theme/last_wallpaper_path
    fi

fi
