# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
su -c '/usr/sbin/usermod -aG $USER sudo' # sudoer
su -c '/usr/sbin/usermod -aG $USER vboxsf' # don't require su privileges to access VBox mounted disks
