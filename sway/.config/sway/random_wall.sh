#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/breeze/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
