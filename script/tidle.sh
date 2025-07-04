#!/bin/bash

running=$(ps aux | grep '[h]ypridle')

if [ -n "$running" ]; then
    pkill hypridle
    echo "hypridle off" > ~/.config/script/idlestate
else
    hyprctl dispatch exec hypridle
    echo "hypridle on" > ~/.config/script/idlestate
fi
