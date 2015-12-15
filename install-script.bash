#!/bin/bash
# install-script - by hringriin
# installs hringriin's haxOS conky setup

# Config
haxOSdir=/home/$USER/.conky/haxOS_Conky
NORMAL='\e[0;00m'
FATNORMAL='\e[1;00m'
RED='\e[0;31m'
FATRED='\e[1;31m'
GREEN='\e[0;32m'
FATGREEN='\e[1;32m'
YELLOW='\e[0;33m'
FATYELLOW='\e[1;33m'
BLUE='\e[0;34m'
FATBLUE='\e[1;34m'
PURPLE='\e[0;35m'
FATPURPLE='\e[1;35m'
echo -e "$NORMAL"

# DON'T TRY THIS AT HOME, KIDS!

# is conky installed?
echo -e "$FATYELLOW"
echo -e "Checking conky installation ..."
echo -e "$NORMAL"
if [[ -e /usr/bin/conky ]] ; then
    echo -e "$FATGREEN"
    echo -e "Conky found!"
    echo -e "$NORMAL"
else
    echo -e "$FATRED"
    echo -e "No installation of conky found!"
    echo -e "Please install conky!"
    echo -e "$NORMAL"
    exit 127
fi

# unzip the tar ball to home folder
echo -e "$FATYELLOW"
echo -e "Decompressing archive ..."
echo -e "$NORMAL"
tar -zxvf haxOS.tar.gz -C ~
chmod +x $haxOSdir/../conky-startup.sh
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

# pip speedtest-cli
echo -e "$FATYELLOW"
echo -e "Installing speedtest-cli for python ..."
echo -e "$NORMAL"
if [[ -e /usr/bin/pip ]] ; then
    sudo pip install speedtest-cli
    sudo pip install speedtest-cli --upgrade
else
    echo -e "No installation of $FATBLUE python $NORMAL"
    echo -e "packagemanager $FATBLUE pip $NORMAL found!"
    echo -e "Please install $FATBLUE pip $NORMAL!"
    exit 127
fi
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

# put autostart
echo -e "$FATYELLOW"
echo -e "Copying autostarter ..."
echo -e "$NORMAL"
cp -v autostart/conky.desktop ~/.config/autostart/
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

echo -e "$FATYELLOW"
echo -e "Setting file permissions on autostarter ..."
echo -e "$NORMAL"
sudo chown -v $USER ~/.config/autostart/conky.desktop
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

# install crontab
echo -e "$FATYELLOW"
echo -e "Setting up cronjob ..."
echo -e "$FATYELLOW"
if [[ -e /usr/bin/crontab ]] ; then
    if [[ -e /var/spool/cron/crontabs/$USER ]] ; then
        echo -e "$GREEN"
        echo -e "Crontab found!"
        echo -e "$NORMAL"
        sudo cat crontab/crontab >> /var/spool/cron/crontabs/$USER
    else
        echo -e "$FATYELLOW"
        echo -e "No Crontab found of not accessible!"
        echo -e "$NORMAL"
        echo -e "Copy the contents of the file $BLUE'crontab'$NORMAL in your\npreferred crontab!"
        sleep 5
    fi
else
    echo -e "Package containing executable $FATBLUE 'crontab' $FATRED not $NORMAL installed!"
    echo -e "    On ArchLinux install $BLUE'cronie'$NORMAL, on Debian have a look at $BLUE'cron'$NORMAL.\n"
    echo -e "$FATRED"
    echo -e "  ! ! !   N O   G  U A R A N T E E   ! ! !"
    echo -e "$FATNORMAL"
    echo -e "Alternatively you can look for your own cron setup."
    echo -e "Have a look at the 'crontab'-files in the installation-archive!"
    echo -e "$NORMAL"
    exit 127
fi
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

# make links
echo -e "$FATYELLOW"
echo -e "Setting up symlinks to /usr/local/bin ..."
echo -e "$NORMAL"
sudo sh -c "cd /usr/local/bin"
sudo ln -vs $haxOSdir/shitstodo addToDo
sudo ln -vs $haxOSdir/editToDo.bash editToDo
sudo ln -vs $haxOSdir/calnote calnote
sudo ln -vs $haxOSdir/calnote_clear calnoteClear
echo -e "$FATGREEN"
echo -e "...done!"
echo -e "$NORMAL"

# weather location code
echo -e "Visit $BLUE'https://weather.codes/germany/'$NORMAL to achieve your personal weather location code!"
read -p "Do you want to enter your weather location code now?" enterlocation

locationupper=`exec echo $enterlocation | awk '{print toupper($0)}'`

if [[ $locationupper == "Y" ]] ; then
    echo -e "$FATGREEN Awesome$NORMAL, go to line $FATPURPLE 41 $NORMAL and $FATNORMAL edit $NORMAL it to your needs!"
    sleep 3
    if [[ -e /usr/bin/vim ]] ; then
        vim +41 $haxOSdir/pyweath.py
    else
        echo -e "$FATBLUE Vim $FATREAD not $NORMAL installed."
        read -p "What's your favorite editor? :" favedit
        $favedit $haxOSdir/pyweath.py
    fi
else
    echo -e "$FATYELLOW Why not?$NORMAL It is $RED ONE $NORMAL CLICK away ..."
    sleep 1
    echo -e "Edit the file $FATBLUE 'pyweath.py' $NORMAL in $FATBLUE '~/.conky/haxOS/' $NORMAL in line $FATPURPLE 41 $NORMAL to your needs"
    echo -e "once you get your ass up to start a fricking web-browser ..."
    sleep 5
fi

echo -e "$FATYELLOW"
echo -e "N O T I C E"
echo -e "$FATNORMAL"
echo -e "The cronjob is designed for ArchLinux!"
echo -e "Users of other systems  $FATRED H A V E   T O $FATNORMAL  look for a"
echo -e "work-around for the pacman script $FATBLUE'checkupdates'$FATNORMAL yourself!"
echo -e "$NORMAL"
sleep 3
echo -e "$FATGREEN"
echo -e "Setup complete! Starting conky!"
sleep 2
$haxOSdir/../conky-startup.sh
exit 0
