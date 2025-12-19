
#!/bin/bash

direction="$1"   # u or d
group_size=3
max_ws=9

# Focused window before
before=$(hyprctl activewindow -j | jq -r '.address')

# Try to move focus
case "$direction" in
    u) hyprctl dispatch movefocus u ;;
    d) hyprctl dispatch movefocus d ;;
    *) exit 1 ;;
esac

# Focused window after
after=$(hyprctl activewindow -j | jq -r '.address')

# If focus changed, we're done
[ "$before" != "$after" ] && exit 0

# ---- fallback: change workspace ONLY ----

current_ws=$(hyprctl activeworkspace -j | jq -r '.id')

# Compute group start
group_start=$(( ( (current_ws - 1) / group_size ) * group_size + 1 ))

if [ "$direction" = "u" ]; then
    target_ws=$(( group_start + group_size ))
else
    target_ws=$(( group_start - group_size ))
fi

# Clamp
if [ "$target_ws" -lt 1 ] || [ "$target_ws" -gt "$max_ws" ]; then
    exit 0
fi

# Activate the whole group (same logic as before)
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

# Focus target workspace
hyprctl dispatch workspace "$target_ws"

