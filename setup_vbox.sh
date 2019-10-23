# Setting up VBox Additions

cd /media/cdrom0
su -c 'sh VBoxAdditions.run'
sudo usermod -aG vboxsf $USER

read -p "Do you want to reboot your workstation now (y/N)? " answer
case ${answer:0:1} in
    y|Y ) sudo reboot ;;
    * ) ;;
esac
