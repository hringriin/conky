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

case $acval in
    -1)
        echo -e "\${alignr}\${offset 0}\${color4}\${blink vanished: \${color3}P A N I C}\${color}    AC ◀─┤"
        ;;
    0)
        echo -e "\${alignr}\${color3}\${acpiacadapter}\${color}        AC ◀─┤"
        ;;
    1)
        echo -e "\${alignr}\${color5}\${acpiacadapter}\${color}        AC ◀─┤"
        ;;
esac

echo -e "\${alignr}│"

# only internal installed
case $value in
    1)
        case $batval0 in
            0)
                echo -e "\${alignr}\${color7}\${blink !! EMPTY !!}\${color}  internal ◀─┘"
            ;;
            [2-4]*)
                echo -e "\${alignr}\${color4}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
                echo -e "\${alignr}\${offset -28}\${color4}\${battery_time BAT0}\${color} ◀─┘"
            ;;
            [5-8]* | 9[0-7])
                echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
                echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT0}\${color} ◀─┘"
            ;;
            9[8-9] | 100)
                echo -e "\${alignr}\${offset 7}\${color6}FULL\${color}  internal ◀─┘"
            ;;
            [1-19]*)
                echo -e "\${alignr}\${color3}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┘"
                echo -e "\${alignr}\${offset -28}\${color3}\${battery_time BAT0}\${color} ◀─┘"
            ;;
            *)
                echo -e "this is interesting,\nint, no int bat!"
            ;;
        esac
    ;;
# internal and slice installed
    2)
        case $batval0 in
            0)
                echo -e "\${alignr}\${color7}\${blink !! EMPTY !!}\${color}  internal ◀─┤"
            ;;
            [2-4]*)
                echo -e "\${alignr}\${color4}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
                echo -e "\${alignr}\${color4}\${battery_time BAT0}\${color} ◀─┘    │"
            ;;
            [5-8]* | 9[0-7])
                echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
                echo -e "\${alignr}\${color5}\${battery_time BAT0}\${color} ◀─┘    │"
            ;;
            9[8-9] | 100)
                echo -e "\${alignr}\${color6}FULL\${color}  internal ◀─┤"
            ;;
            [1-19]*)
                echo -e "\${alignr}\${color3}\${battery_bar 10,75 BAT0} $batval0 %\${color}  internal ◀─┤"
                echo -e "\${alignr}\${color3}\${battery_time BAT0}\${color} ◀─┘    │"
            ;;
            *)
                echo -e "this is interesting,\nint+slice, no int bat!"
            ;;
        esac

        echo -e "\${alignr}│"

        case $batval1 in
            0)
                echo -e "\${alignr}\${offset 7}\${color7}\${blink !! EMPTY !!}\${color}  external ◀─┘"
            ;;
            [2-4]*)
                echo -e "\${alignr}\${offset 7}\${color4}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┤"
                echo -e "\${alignr}\${offset 7}\${color4}\${battery_time BAT1}\${color} ◀─┘    │"
            ;;
            [5-8]* | 9[0-7])
                echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┘"
                echo -e "\${alignr}\${offset -28}\${color5}\${battery_time BAT1}\${color} ◀─┘"
            ;;
            9[8-9] | 100)
                echo -e "\${alignr}\${offset 7}\${color6}FULL\${color}  external ◀─┘"
            ;;
            [1-19]*)
                echo -e "\${alignr}\${offset 7}\${color3}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┤"
                echo -e "\${alignr}\${offset 7}\${color3}\${battery_time BAT1}\${color} ◀─┘    │"
            ;;
            *)
                echo -e "this is interesting,\nint+slice, no int bat!"
            ;;
        esac
    ;;
# no internal bat, but slice installed
    3)
        case $batval1 in
            0)
                echo -e "\${alignr}\${color7}\${blink !! EMPTY !!}\${color}  external ◀─┤"
            ;;
            [2-4]*)
                echo -e "\${alignr}\${color4}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┤"
                echo -e "\${alignr}\${color4}\${battery_time BAT1}\${color} ◀─┘    │"
            ;;
            [5-8]* | 9[0-7])
                echo -e "\${alignr}\${color5}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┤"
                echo -e "\${alignr}\${color5}\${battery_time BAT1}\${color} ◀─┘    │"
            ;;
            9[8-9] | 100)
                echo -e "\${alignr}\${color6}FULL\${color}  external ◀─┘"
            ;;
            [1-19]*)
                echo -e "\${alignr}\${color3}\${battery_bar 10,75 BAT1} $batval1 %\${color}  external ◀─┤"
                echo -e "\${alignr}\${color3}\${battery_time BAT1}\${color} ◀─┘    │"
            ;;
            *)
                echo -e "this is interesting,\nint+slice, no int bat!"
            ;;
        esac
    ;;
    0)
        echo -e "\${alignr}\${offset 7}\${color4}\${blink no batteries found}\${color}  ◀─┘"
esac
