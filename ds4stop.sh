#!/bin/sh
systemctl stop ds4.target
systemctl stop ds4hook
systemctl stop ds4leds
systemctl stop ds4xb
kill -9 $(cat /tmp/ds4leds.pid) &
kill -9 $(cat /tmp/ds4hook.pid) &
kill -9 $(cat /tmp/ds4xb.pid) &
rm /tmp/{ds4leds.pid,ds4hook.pid,ds4xb.pid}