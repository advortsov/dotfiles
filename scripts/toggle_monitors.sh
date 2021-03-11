is_main_monitor_using=$(xrandr | grep "eDP1 connected")

killall -q polybar
if [[ $is_main_monitor_using == *"primary 1920x1080"* ]]; then
    echo "Toggle to UHD monitor and switch off main"
    xrandr --output eDP1 --off --output DP3 --auto
    polybar monitor2 >>/tmp/polybar2.log 2>&1
else
    echo "Toggle to main monitor" 
    xrandr --output eDP1 --auto
    polybar example >>/tmp/polybar1.log 2>&1 &
fi
