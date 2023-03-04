#!/bin/sh

kill -9 $(cat /tmp/ds4hook.pid)
rm /tmp/ds4hook.pid

echo $$ > /tmp/ds4hook.pid
evdevhook /usr/local/etc/ds4.json