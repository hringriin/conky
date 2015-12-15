#/bin/bash
# update
file="/home/$USER/.conky/haxOS_Conky/.update-list"

rm -f $file
touch $file

while IFS='' read -r line  || [[ -n "$line" ]] ; do
    echo -e "▷ $line" >> $file
done < "$1"
