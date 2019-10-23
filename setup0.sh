# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
source ~/.bashrc
cd
runuser -l root '/usr/sbin/usermod -aG $USER sudo' # sudoer
runuser -l root '/usr/sbin/usermod -aG $USER vboxsf' # don't require su privileges to access VBox mounted disks
