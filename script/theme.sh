#! /bin/sh

rm /home/user/.config/script/theme/*

wallpaper_path="$(find ~/images/unamed/ -type f | shuf -n 1)"
#wallpaper_path="/home/user/images/p0.png"

echo $wallpaper_path > /home/user/.config/script/theme/last_wallpaper_path

magick $wallpaper_path -define jpg:extent=1MB /home/user/.config/script/theme/current.jpg
mv /home/user/.config/script/theme/current-0.jpg /home/user/.config/script/theme/current.jpg 

swww img --transition-type wave "$wallpaper_path"

wallust run "$wallpaper_path"

pkill waybar && hyprctl dispatch exec waybar
pkill dunst  && hyprctl dispatch exec dunst
