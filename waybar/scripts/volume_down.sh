
#!/bin/bash

# Amount to decrease
delta=5

# Get current volume as integer %
current=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print int($2*100)}')

# Calculate new volume
new=$((current - delta))
if [ "$new" -lt 0 ]; then
    new=0
fi

# Set new volume
wpctl set-volume @DEFAULT_SINK@ "$new%"

# If volume reaches 0, mute
if [ "$new" -eq 0 ]; then
    wpctl set-mute @DEFAULT_SINK@ 1
fi
