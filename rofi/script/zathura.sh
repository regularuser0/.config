#!/bin/bash
«»
find ~/Documents ~/Downloads -type f -iname "*.pdf" \
  | sed "s|$HOME/||" \
  | sort \
  | rofi -dmenu -no-show-icons -matching fuzzy -theme ~/.config/rofi/style.rasi \
  | xargs -r zathura
