# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
su -c '/usr/sbin/usermod -aG sudo $USER'

echo "Changes require the user to logout and login again before being effective."
read -p "Do you want to logout now (y/N)? " answer
case ${answer:0:1} in
    y|Y )
        if [[ $USER != "root" ]]; then
            pkill -KILL -u $USER
        fi
        ;;
    * )
        echo "error: cannot logout root user."
        echo "Please logout manually."
        ;;
esac
