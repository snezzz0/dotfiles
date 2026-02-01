#!/usr/bin/env bash
# Fixed Theme: No search bar, no scrollbar, exact sizing
THEME="window { width: 300px; border: 2px; border-color: #ff9e64; } listview { lines: 4; scrollbar: false; }"

# Options in your specific order
logout="Logout"
shutdown="Shutdown"
reboot="Reboot"
sleep="Sleep"

# The order here determines the order in Rofi
options="$logout\n$shutdown\n$reboot\n$sleep"

# Execute Rofi
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme-str "$THEME")

case $chosen in
    *"Logout"*)
        niri msg action quit
        ;;
    *"Shutdown"*)
        systemctl poweroff
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Sleep"*)
        systemctl suspend
        ;;
esac
