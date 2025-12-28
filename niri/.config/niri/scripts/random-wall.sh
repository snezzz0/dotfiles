#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/walls/purple"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
