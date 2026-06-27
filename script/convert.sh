#! /bin/sh


for ((i = 0 ; i < 10 ; i++)); do
    wallpaper_path="$(find ~/images/gif/ -type f | shuf -n 1)"
    
    ffmpeg -i "$wallpaper_path" -vf "fps=20,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop -1 ~/images/output/1"$i".gif
    
    rm $wallpaper_path

done





