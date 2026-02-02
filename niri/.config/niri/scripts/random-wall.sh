#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/minimal/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
