#!/bin/bash

kill -9 $(cat /tmp/ds4leds.pid)
rm /tmp/ds4leds.pid

echo $$ > /tmp/ds4leds.pid

LED=$(cat /sys/class/leds/*\:blue/brightness)

while [ $LED > 0 ]
do
    echo 1 > /sys/class/leds/*\:green/brightness || break
    echo 0 > /sys/class/leds/*\:blue/brightness || break
    echo 0 > /sys/class/leds/*\:red/brightness || break
    sleep 120
done