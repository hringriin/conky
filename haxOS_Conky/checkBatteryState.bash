#!/bin/bash
# checkBatteryState

#leet chars: ┤┤└└┴┴┐┐││┘┘┌┌├├┬┬┼┼┴┴── ││ ▽▼△▲▵▴▾▿◂◀


# EDIT THE FOLLOWING THREE LINES ACCORDING TO YOUR SYSTEM
# If you're a lenovo user you might want to install the
# tp_smapi package
bat0='/sys/class/power_supply/BAT0/capacity'
bat1='/sys/class/power_supply/BAT1/capacity'
ac='/sys/class/power_supply/AC/online'


# DO NOT TOUCH THE FOLLOWING LINES EXCEPT YOU KNOW
# WHAT YOU'RE DOING!

batval0=0
batval1=0

value=0 #   0 = uninitialized
        #   1 = bat1
        #   2 = bat1 & bat2
        #   3 = bat2
        #   4 = no batt

if [[ -f $bat0 ]] ; then
    batval0=`cat $bat0`
    value=1
    if [[ -f $bat1 ]] ; then
        batval1=`cat $bat1`
        value=2
    fi
else
    if [[ -f $bat1 ]] ; then
        batval1=`cat $bat1`
        value=3
    else
        value=4
    fi
fi

if [[ -f $ac ]] ; then
    acval=`cat $ac`
else
    acval="-1"
fi

if [[ $acval -eq "-1" ]] ; then
    echo -e "\${alignr}\${color4}\${blink 'AC vanished - Good time to PANIC!'}\${color}      AC ◀─┤"
elif [[ $acval -eq 0 ]] ; then
    echo -e "\${alignr}\${color3}\${acpiacadapter}\${color}        AC ◀─┤"
elif [[ $acval -eq 1 ]] ; then
    echo -e "\${alignr}\${color5}\${acpiacadapter}\${color}        AC ◀─┤"
fi

echo -e "\${alignr}│"

# only internal installed
if [[ $value -eq 1 ]] ; then
    if [[ $batval0 -ge 98 ]] ; then
        echo -e "\${alignr}\${offset 7}\${color6}FULL\${color}  internal ◀─┘"
    elif [[ $batval0 -lt 98 ]] ; then
        if [[ $batval0 -gt 50 ]] ; then
            echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT0}\${color} ◀─┘"
        fi
    elif [[ $batval0 -lt 50 ]] ; then
        if [[ $batval0 -gt 20 ]] ; then
            echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT0}\${color} ◀─┘"
        fi
    elif [[ $batval0 -lt 20 ]] ; then
        if [[ $batval0 -ge 0 ]] ; then
            echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT0}\${color} ◀─┘"
        fi
    elif [[ $batval0 -lt 0 ]] ; then
        echo -e "\${alignr}\${color3}\${blink !! EMPTY !!}\${color}  internal ◀─┘"
    fi
# internal and slice installed
elif [[ $value -eq 2 ]] ; then
    if [[ $batval0 -ge 98 ]] ; then
        echo -e "\${alignr}\${color6}FULL\${color}  internal ◀─┘"
    elif [[ $batval0 -lt 98 ]] ; then
        if [[ $batval0 -gt 50 ]] ; then
            echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
            echo -e "\${alignr}\${color5}\${battery_time BAT0}\${color} ◀─┘    │"
        fi
    elif [[ $batval0 -lt 50 ]] ; then
        if [[ $batval0 -gt 20 ]] ; then
            echo -e "\${alignr}\${color4}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
            echo -e "\${alignr}\${color4}\${battery_time BAT0}\${color} ◀─┘    │"
        fi
    elif [[ $batval0 -lt 20 ]] ; then
        if [[ $batval0 -ge 0 ]] ; then
            echo -e "\${alignr}\${color3}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
            echo -e "\${alignr}\${color3}\${battery_time BAT0}\${color} ◀─┘    │"
        fi
    elif [[ $batval0 -lt 0 ]] ; then
        echo -e "\${alignr}\${color3}\${blink !! EMPTY !!}\${color}  internal ◀─┤"
    fi

    echo -e "\${alignr}│"

    if [[ $batval1 -ge 98 ]] ; then
        echo -e "\${alignr}\${offset 7}\${color6}FULL\${color}  external ◀─┘"
    elif [[ $batval1 -lt 98 ]] ; then
        if [[ $batval1 -gt 50 ]] ; then
            echo -e "\${alignr}\${offset 0}\${color5}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 50 ]] ; then
        if [[ $batval1 -gt 20 ]] ; then
            echo -e "\${alignr}\${offset 0}\${color4}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color4}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 20 ]] ; then
        if [[ $batval1 -ge 0 ]] ; then
            echo -e "\${alignr}\${offset 7}\${color3}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color3}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 0 ]] ; then
        echo -e "\${alignr}\${color3}\${blink !! EMPTY !!}\${color}  external ◀─┘"
    fi
# no internal bat, but slice installed
elif [[ $value -eq 3 ]] ; then
    if [[ $batval1 -ge 98 ]] ; then
        echo -e "\${alignr}\${offset 7}\${color6}FULL\${color}  external ◀─┘"
    elif [[ $batval1 -lt 98 ]] ; then
        if [[ $batval1 -gt 50 ]] ; then
            echo -e "\${alignr}\${offset 0}\${color5}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 50 ]] ; then
        if [[ $batval1 -gt 20 ]] ; then
            echo -e "\${alignr}\${offset 0}\${color4}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color4}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 20 ]] ; then
        if [[ $batval1 -ge 0 ]] ; then
            echo -e "\${alignr}\${offset 0}\${color3}\${battery_bar 10,75 BAT1} $batval1 %\${color}  internal ◀─┘"
            echo -e "\${alignr}\${offset -28}\${color3}\${battery_time BAT1}\${color} ◀─┘"
        fi
    elif [[ $batval1 -lt 0 ]] ; then
        echo -e "\${alignr}\${color3}\${blink !! EMPTY !!}\${color}  external ◀─┘"
    fi
fi
