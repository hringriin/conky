sleep 2s
killall conky
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_cal" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_clock" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_mpd" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_mpd_stuga" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_speed" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_stod" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_updates" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conky_weather" &
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/$USER/.conky/haxOS_Conky/.conkyrc" &
sleep 5
cd "/home/$USER/.conky/haxOS_Conky"
conky -c "/home/hringriin/.conky/haxOS_Conky/.conky_battery" &
