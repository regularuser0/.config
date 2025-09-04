#!/usr/bin/env bash

CMD=linux-discord-r
CFG="$HOME/.config/linux-discord-rich-presencerc"

if pgrep -x "$CMD" >/dev/null; then
    pkill -x "$CMD"
    echo "off" > ~/.config/script/presence-state 
else
    linux-discord-rich-presence -c "$CFG" >/dev/null 2>&1 &
    disown
    echo "on" > ~/.config/script/presence-state 
fi
