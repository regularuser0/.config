#!/bin/bash

running=$(ps aux | grep '[h]ypridle')

if [ -n "$running" ]; then
    pkill hypridle
    echo "off" > ~/.config/script/idlestate
else
    hyprctl dispatch exec hypridle
    echo "on" > ~/.config/script/idlestate
fi
