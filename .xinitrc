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

# Dual Monitors at 144hz
xrandr --output DP-4 --primary --left-of DP-2 --mode 1920x1080 --rate 144
xrandr --output DP-2 --right-of DP-4 --mode 1920x1080 --rate 144

# Set first razer mouse found to 2800 DPI
razercfg -d mouse -r 1:28

# Background
~/.fehbg &

# Transparency and Shadows
compton &
disown compton

# Lock screen and "screensaver", multiple monitors handled in xmonad
# st -A .4 -e pipes.sh &
# slock &

# Static Xmobar positions for two monitors
xmobar -p 'Static {xpos=0, ypos=0, width=1920, height=25}' &
disown xmobar
xmobar -p 'Static {xpos=1920, ypos=0, width=1920, height=25}' &
disown xmobar

exec xmonad 
