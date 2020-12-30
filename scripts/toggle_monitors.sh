is_main_monitor_using=$(xrandr | grep "eDP1 connected")
if [[ $is_main_monitor_using == *"primary 1920x1080"* ]]; then
    echo "Toggle to UHD monitor and switch off main"
    xrandr --output eDP1 --off --output DP3 --auto
else
    echo "Toggle to main monitor" 
    xrandr --output eDP1 --auto
fi
