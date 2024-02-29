#!/bin/sh

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
    ."$HOME/.xprofile"
fi

xwallpaper --zoom ~/pics/mountain.jpg
wal -R &

# Activate dbus variables
dbus-update-activation-environment --all
exec dwm
