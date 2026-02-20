#!/bin/bash
WINDOW_ID=$(niri msg windows | grep -B5 'App ID: "qtws"' | grep "Window ID" | awk '{print $3}' | tr -d ':')

if [ -n "$WINDOW_ID" ]; then
    niri msg action focus-window --id "$WINDOW_ID"
else
    gtk-launch youtube-music-desktop &
    # Poll until window appears then focus it
    for i in $(seq 1 20); do
        sleep 0.5
        WINDOW_ID=$(niri msg windows | grep -B5 'App ID: "qtws"' | grep "Window ID" | awk '{print $3}' | tr -d ':')
        if [ -n "$WINDOW_ID" ]; then
            niri msg action focus-window --id "$WINDOW_ID"
            break
        fi
    done
fi
