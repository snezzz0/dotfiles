#!/usr/bin/env bash

# Read bookmarks file
bookmarks_file="$HOME/.config/rofi/scripts/bookmarks.txt"

# Show rofi input prompt
query=$(echo "" | rofi -dmenu -i -p "Search" \
    -theme-str 'window {width: 15%; height: 44px;} listview {lines: 0;} 
    inputbar { background-color: #2D4F67; } 
    prompt { text-color: #7FB4CA; font: "bold 11"; } 
    entry { text-color: #DCD7BA; }')

# If nothing entered, exit
if [ -z "$query" ]; then
    exit 0
fi

# Try to find matching bookmark (fuzzy match)
# Format: grep case-insensitive, find lines containing all characters from query
match=$(grep -v '^$' "$bookmarks_file" | grep -i "$query" | head -n 1)

if [ -n "$match" ]; then
    # Extract URL (everything after the last ::)
    url=$(echo "$match" | sed 's/.*:: //')
    thorium-browser-avx2 "$url" &
else
    # No bookmark match, search Google
    search_query=$(echo "$query" | sed 's/ /+/g')
    thorium-browser-avx2 "https://www.google.com/search?q=$search_query" &
fi
