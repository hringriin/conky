#!/bin/bash

if ping -c 1 -W 2 192.168.2.35 > /dev/null ; then
    echo "home"
elif ping -c 1 -W 2 134.102.209.202 > /dev/null ; then
    echo "stuga"
fi
