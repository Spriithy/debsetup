# Add user to sudoers

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
su -c '/usr/sbin/usermod -aG sudo $USER'
