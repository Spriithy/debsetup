# debsetup

My simple setup scripts for new Debian VMs/installs.

## setup_sudo.sh

By default, installing Debian doesn't make your user a sudoer. This script makes you a sudoer and will prompt you to logout / login again for the changes to make effect.

## setup_vbox.sh

This script will install the Guest Additions CD image (must be inserted first using VirtualBox `Devices > Insert Guest Additions CD image...`).

It will then prompt you to reboot your computer so the changes may take effect.

## setup_tools.sh

This script sets up some useful things.

1) Allows you to set an HTTP(S) proxy
2) Upgrades your packages
3) Installs some useful packages
	a) Configures your git identity
4) Sets up a python virtualenv
	a) Downloads some Python datascience-related packages
5) Installs Docker

It is recommendend to restart your machine/VM after the installation is complete.
