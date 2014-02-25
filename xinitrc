# vim:ft=sh

# vga resolution
vgares="`xrandr | awk '/DP1 connected/ { getline ; print $1 }'`"

if [ -n "$vgares" ]
then
    # External screen connected
    xrandr --output LVDS1 --below DP1 --mode 1600x900_0.0
    
    if [ "$vgares" = "1600x900" ]
    then
        # home 
        xrandr --newmode '1600x900_0.0'  108.00  1600 1624 1704 1800   900  901  904 1000 +hsync +vsync

        xrandr --addmode DP1 '1600x900_0.0'

        xrandr --output DP1 --above LVDS1 --mode 1600x900_0.0
    else
        # work
        xrandr --addmode LVDS1 '1600x900_0.0'
        xrandr --output DP1 --above LVDS1 --mode $vgares
    fi
fi

feh --bg-scale /home/ema/Pictures/Silicon-Graphics-SGI-Irix-Blue-HD-Wallpaper.jpg &

# exec --no-startup-id /usr/bin/ssh-add &

#xfce4-session 2>&1

#/usr/lib/udisks/udisks-daemon &
#/usr/sbin/console-kit-daemon --no-daemon &
#/usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session &
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

#ck-launch-session 
dbus-launch --exit-with-session i3 2>&1
