#!/usr/bin/env sh

WALLDIR="$HOME/pics/everforest/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
