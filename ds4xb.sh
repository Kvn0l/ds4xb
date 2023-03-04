#!/bin/bash

kill -9 $(cat /tmp/ds4xb.pid) 
rm /tmp/ds4xb.pid

echo $$ > /tmp/ds4xb.pid
EVNUM=`grep 'Name="Wireless Controller"' -A 4 /proc/bus/input/devices | tail -1 | sed -E 's/^.*event([0-9]+)\s.*$/\1/'`
[ ! -z "$EVNUM" ] && xboxdrv --evdev "/dev/input/event${EVNUM}" --config /usr/local/etc/ds4xb.xboxdrv
