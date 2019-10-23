#!/bin/env bash

# Setting up VBox Additions

DIR="/media/cdrom0"

if [[ ! -d "$DIR" ]]; then
	echo "No Guest Additions CD image found."
	echo "Please insert the Guest Additions CD image before running this script."	
	exit 1
fi

cd $DIR
sudo sh VBoxLinuxAdditions.run
sudo usermod -aG vboxsf $USER

read -p "Do you want to reboot your workstation now (y/N)? " answer
case ${answer:0:1} in
	y|Y )
		sudo reboot
		;;
	* )
		;;
esac
