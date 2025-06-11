#! /bin/sh

rm /home/user/.config/script/theme/*

wallpaper_path="$(find ~/images/selected_walls/ -type f | shuf -n 1)"

echo $wallpaper_path > /home/user/.config/script/theme/last_wallpaper_path
#magick $wallpaper_path -quality 10% ~/.config/script/theme/current.png # lower the quality for rofi latency
magick $wallpaper_path -define png:extent=1MB /home/user/.config/script/theme/current.jpg

swww img --transition-type wave "$wallpaper_path"

wallust run "$wallpaper_path"

pkill waybar && hyprctl dispatch exec waybar
pkill dunst  && hyprctl dispatch exec dunst
