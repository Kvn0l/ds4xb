#!/bin/sh
EVNUM=`grep 'Name="Wireless Controller"' -A 4 /proc/bus/input/devices | tail -1 | sed -E 's/^.*event([0-9]+)\s.*$/\1/'`
[ ! -z "$EVNUM" ] && xboxdrv --evdev "/dev/input/event${EVNUM}" --config /usr/local/etc/ds4xb.xboxdrv --pid-file /tmp/ds4xb.pid
