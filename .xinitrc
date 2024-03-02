#!/bin/sh

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
    . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
    ."$HOME/.xprofile"
fi

# Activate dbus variables
dbus-update-activation-environment --all

feh --bg-fill pics/squidgame.jpeg &
xcompmgr &
while true; do
    xsetroot -name "mem: `free -h | awk '(NR==2){ print $3 }'` bat:`cat '/sys/class/power_supply/BAT0/capacity'`% `cat '/sys/class/power_supply/BAT0/status'` wifi:`cat '/sys/class/net/wlp2s0/operstate'` `date` $(date +"%F $R" )"
    sleep 1
done &

wal -R &
exec dwm
