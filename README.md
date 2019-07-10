# conky

This is a set of conky-configuration files, bash- and python scripts.

![Screenshot](images/screenshot.png "Screenshot")

Thanks to DavidDavioBlue, who provided the basis of this conky-setup on [deviantart.com][ddbda-link].  
DDB also just adapted his version, the basis is provided [here][ddb-basis], also on DeviantArt.com.

# Installation

It is sufficient to run the `install-script.bash` from the command line. But at
this point, there are several files, that need to be changed according to your
username to work properly. I do not know yet why some files are not capable of
using `$USER`, but providing the full qualified path works just fine.

List of affected files referring to the git file structure:

    * autostart/conky.desktop
    * crontab/crontab
    * haxOS/.conky_battery
    * haxOS/.conky_weather

## checkupdates

There is a script used, called 'checkupdates', which is actually a package from
the [AUR][aur-checkupdates]. I don't know about Debian/Ubuntu or other
distributions, but to be honest, I don't care at this point.

# Bugs

There are still some minor bugs. I you like, write a bug report.

[ddbda-link]: http://daviddavioblue.deviantart.com/art/haxOS-Conky-454353060 "DavidDavioBlue - haxOS Conky on DeviantArt.com"
[ddb-basis]: http://0x6c756b65.deviantart.com/art/slacker-conky-config-207760045 "0x6c756b65 - slacker conky config on DeviantArt.com"
[aur-checkupdates]: https://aur.archlinux.org/packages/?O=0&K=checkupdates "CheckUpdates"
