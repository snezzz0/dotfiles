#!/usr/bin/env bash
# Configuration
WALLPAPER_DIR="${HOME}/Wallpapers/"
CONFIG_FILE="${HOME}/.config/hypr/hyprpaper.conf"
MONITOR_1="DP-1"  # 2K monitor
MONITOR_2="DP-2"  # 1080p monitor

# Function to change wallpaper
change_wallpaper() {
    # Find all wallpaper files safely (handling spaces)
    local wallpapers=()
    while IFS= read -r -d $'\0' file; do
        wallpapers+=("$file")
    done < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) -print0)
    
    # Exit if no wallpapers found
    if [ ${#wallpapers[@]} -eq 0 ]; then
        echo "No wallpapers found in directory: $WALLPAPER_DIR"
        exit 1
    fi
    
    # Select ONE random wallpaper for both monitors
    local random_index=$((RANDOM % ${#wallpapers[@]}))
    local selected_wallpaper="${wallpapers[$random_index]}"
    
    echo "Setting wallpaper for both monitors: $selected_wallpaper"
    
    # Kill existing hyprpaper instances
    pkill hyprpaper || true
    
    # Ensure config file exists and is writable
    if ! touch "$CONFIG_FILE" 2>/dev/null; then
        echo "No write permission for $CONFIG_FILE. Creating temporary config..."
        CONFIG_FILE="$(mktemp /tmp/hyprpaper_temp.XXXXXX.conf)"
    fi
    
    # Write new configuration (same wallpaper for both monitors)
    cat > "$CONFIG_FILE" << EOF
preload = $selected_wallpaper
wallpaper = $MONITOR_1,$selected_wallpaper
wallpaper = $MONITOR_2,$selected_wallpaper
ipc = true
EOF
    
    echo "Configuration written to: $CONFIG_FILE"
    
    # Start hyprpaper
    hyprpaper -c "$CONFIG_FILE" &
    local pid=$!
    
    # Verify hyprpaper started
    sleep 1
    if ! kill -0 $pid 2>/dev/null; then
        echo "Error: Failed to start hyprpaper!"
        exit 1
    fi
}

# Check dependencies
if ! command -v hyprpaper &> /dev/null; then
    echo "Error: hyprpaper is not installed!"
    exit 1
fi

# Validate wallpaper directory
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory does not exist: $WALLPAPER_DIR"
    exit 1
fi

# Main execution
if [ "${1}" = "once" ]; then
    change_wallpaper
else
    echo "Starting wallpaper rotation every 30 minutes..."
    trap 'echo "Exiting..."; pkill hyprpaper; exit 0' SIGINT SIGTERM
    
    while true; do
        change_wallpaper
        echo "Next wallpaper change in 30 minutes..."
        sleep 1800  # 30 minutes in seconds
    done
fi
