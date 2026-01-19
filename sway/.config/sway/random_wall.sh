#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/tokyonight_walls/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
