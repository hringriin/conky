#! /bin/bash
cal_var=`date +%_d`;
cal | sed s/"\(^\|[^0-9]\)$cal_var"'\b'/'\1${font Monospace:bold:pixelsize=11}${color2}'"$cal_var"'${font}${color}'/ \
