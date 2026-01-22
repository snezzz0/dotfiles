#!/usr/bin/env sh

WALLDIR="$HOME/Pictures/cyberpunk_tokyonight/"

WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"

exec swaybg -m fill -i "$WALLPAPER"
