
#!/bin/bash

offset=${1:-1}
max_ws=9

current_ws=$(hyprctl activewindow | awk '/workspace/ {print $2}')

# Compute group (1–3, 4–6, 7–9)
group_start=$(( ( (current_ws - 1) / 3 ) * 3 + 1 ))
group_end=$(( group_start + 2 ))

if [ "$offset" -eq 1 ] || [ "$offset" -eq -1 ]; then
    # Move inside the same group with wrap
    target_ws=$(( current_ws + offset ))

    if [ "$target_ws" -gt "$group_end" ]; then
        target_ws=$group_start
    elif [ "$target_ws" -lt "$group_start" ]; then
        target_ws=$group_end
    fi
else
    # Group jump (±3)
    target_ws=$(( current_ws + offset ))

    if [ "$target_ws" -gt "$max_ws" ] || [ "$target_ws" -lt 1 ]; then
        exit 0
    fi
fi

# Move window
hyprctl dispatch movetoworkspace "$target_ws"

# Activate full group (keep monitors aligned)
case "$target_ws" in
    1|2|3)
        hyprctl dispatch workspace 1
        hyprctl dispatch workspace 2
        hyprctl dispatch workspace 3
        ;;
    4|5|6)
        hyprctl dispatch workspace 4
        hyprctl dispatch workspace 5
        hyprctl dispatch workspace 6
        ;;
    7|8|9)
        hyprctl dispatch workspace 7
        hyprctl dispatch workspace 8
        hyprctl dispatch workspace 9
        ;;
esac

hyprctl dispatch workspace "$target_ws"

