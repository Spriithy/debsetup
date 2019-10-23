# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
/usr/sbin/runuser -l root '/usr/sbin/usermod -aG $USER sudo' # sudoer
/usr/sbin/runuser -l root '/usr/sbin/usermod -aG $USER vboxsf' # don't require su privileges to access VBox mounted disks
