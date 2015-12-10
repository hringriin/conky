#!/bin/bash
# weather

icon=`exec python2.7 /home/$USER/.conky/haxOS_Conky/pyweath.py | grep "Condition" | awk '{print $4}'`

iconfile=$icon.png

echo $iconfile
