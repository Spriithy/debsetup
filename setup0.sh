# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
su -c '/usr/sbin/usermod -aG sudo $USER' # sudoer
su -c '/usr/sbin/usermod -aG vboxsf $USER' # don't require su privileges to access VBox mounted disks
