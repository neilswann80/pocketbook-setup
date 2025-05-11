#!/bin/sh

dialog=/ebrmain/cramfs/bin/dialog
temp=/var/tmp/puzzle

$dialog 1 "" "Downloading SGTPuzzles" "PLEASE WAIT..." &
downloadFile=$(curl -s https://api.github.com/repos/SteffenBauer/PocketPuzzles/releases/latest | grep -wo "https.*zipball.*")
downloadFile=${downloadFile//\",/}
if [ "$downloadFile" == "" ]; then
    message=$(echo -e "Connect to internet and try again.")
    $dialog 3 "" "$message" "OK"; exit
fi
rm -rf $temp; mkdir $temp; cd $temp
wget $downloadFile -O $temp/SGTPuzzles.zip
unzip -o $temp/SGTPuzzles.zip */stable/SGTPuzzles.app -d $temp
mv -f $(find . -name "SGTPuzzles.app") /mnt/ext1/applications/SGTPuzzles.app
message=$(echo -e "SGTPuzzles installed!")
$dialog 1 "" "$message" "OK"

