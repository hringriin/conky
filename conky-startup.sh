sleep 2
killall conky
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_cal" &
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_syspanel" &
sleep 1
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_clock" &
sleep 1
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_mpd" &
sleep 1
conky -c "/home/hringriin/.conky/haxOS_Conky/.conky_gmail" &
sleep 1
conky -c "/home/hringriin/.conky/haxOS_Conky/.conky_rss" &
sleep 1
conky -c "/home/hringriin/.conky/haxOS_Conky/.conky_tor" &
sleep 1
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_stod" &
sleep 1
#conky -c "/home/$USER/.conky/haxOS_Conky/.conky_updates" &
#sleep 1
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_weather" &
sleep 1
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_speed" &
#sleep 5
#conky -c "/home/$USER/.conky/haxOS_Conky/.conky_battery" &
