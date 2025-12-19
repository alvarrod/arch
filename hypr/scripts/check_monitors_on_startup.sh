#!/bin/bash
echo "entro script $(date)" >> ~/.config/hypr/sci.txt

# Paths to your monitor config files
LAPTOP_CONF="/home/arr02/.config/hypr/monitors_laptop.conf"
DOCK_CONF="/home/arr02/.config/hypr/monitors_triple.conf"
CURRENT_CONF="/home/arr02/.config/hypr/monitors.conf"

# Dock detection string (change if your dock name differs)
DOCK_NAME="ThinkPad Thunderbolt 5"

# Check if dock is connected and status is not "disconnected"
DOCK_INFO=$(boltctl list | grep -A 5 "$DOCK_NAME") # grab the dock info block
DOCK_STATUS=$(echo "$DOCK_INFO" | grep -i "status:" | awk '{print $3}')

if [[ "$DOCK_STATUS" != "disconnected" ]]; then
    # Dock is active
    cp "$DOCK_CONF" "$CURRENT_CONF"
    hyprctl reload
else
    # Dock is inactive/disconnected
    cp "$LAPTOP_CONF" "$CURRENT_CONF"
    hyprctl reload
fi

