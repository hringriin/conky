sleep 2s
killall conky
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_cal" &
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_clock" &
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_mpd" &
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_mpd_stuga" &
#cd "${HOME}/.conky/haxOS_Conky"
#conky -c "${HOME}/.conky/haxOS_Conky/.conky_speed" &
##cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_stod" &
#cd "${HOME}/.conky/haxOS_Conky"
#conky -c "${HOME}/.conky/haxOS_Conky/.conky_updates" &
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_weather" &
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conkyrc" &
sleep 5
#cd "${HOME}/.conky/haxOS_Conky"
conky -c "${HOME}/.conky/haxOS_Conky/.conky_battery" &
