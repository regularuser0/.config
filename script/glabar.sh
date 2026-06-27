#! /bin/bash
isrunnig=$(ps aux | grep '[w]aybar' )

if [ -n "$isrunnig" ] ; then
    pkill waybar
else
    hyprctl dispatch exec waybar
fi
