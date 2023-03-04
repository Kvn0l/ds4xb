#!/bin/bash

if [ -f /tmp/ds4xb.pid ]; then
    pkexec ds4stop.sh
    notify-send -i joystick ds4xb Disabled
else
    pkexec systemctl start ds4.target
    notify-send -i joystick ds4xb enabled
fi