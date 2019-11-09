#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Fix stupid cursor
xsetroot -cursor_name left_ptr

# Set first razer mouse found to 2800 DPI
razercfg -d mouse -r 1:28

# Transparency and Shadows
compton &
disown compton

# Dual Monitors
# xrandr --output VGA1 --primary --left-of LVDS1 --output LVDS1 --auto

# Background
~/.fehbg &

# Lock screen and "screensaver", multiple monitors handled in xmonad
# st -A .4 -e pipes.sh &
# slock &

exec xmonad 
