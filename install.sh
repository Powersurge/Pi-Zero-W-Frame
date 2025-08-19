#########################################################################
#Pi Zero W Frame                                                        #
#This script will install Apache, PHP, Inotify-Tools, and Rclone.             #
#This script was written by Chris Newell                                #
#[C] 2023 Chris Newell: See LICENSE.md for details                      #
#########################################################################

#!/bin/bash

#Prerequisites
sudo apt-get update
sudo apt-get install -y jq

#ipaddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/');
ipaddress=$(ip -j a | jq -r 'map(select(.operstate == "UP"))|map(.addr_info) | map(map(select(.family == "inet").local)) | flatten | .[]');

#Apache
sudo apt-get install -y apache2
sudo chown -R www-data:www-data /var/www/html
sudo rm -Rf /var/www/html/*

#PHP
sudo apt-get install -y php libapache2-mod-php

#Rclone
sudo apt-get install -y rclone

#Copy files from TAR file
sudo tar xvjf pizerowframe.tar.bz2 --no-overwrite-dir -C /

#Permissions
if ! sudo grep -xqs "www-data  ALL=NOPASSWD: /usr/share/pizerowframe/run_sudo.sh" /etc/sudoers; then
  echo "www-data  ALL=NOPASSWD: /usr/share/pizerowframe/run_sudo.sh" | sudo tee -a /etc/sudoers
fi
sudo chown -R www-data:www-data /usr/share/pizerowframe
sudo chown root:root /etc/cron.d/checkin
sudo chown root:root /etc/systemd/system/usbshare.service
sudo chmod +x /usr/share/pizerowframe/usb_share.sh
sudo chmod +x /usr/share/pizerowframe/usb_mass_storage_gadget.sh

#Watchdog
sudo apt-get install -y inotify-tools
sudo systemctl daemon-reload
sudo systemctl enable usbshare.service
sudo systemctl start usbshare.service

#Enable the USB driver
if ! sudo grep -xqs "dtoverlay=dwc2" /boot/firmware/config.txt; then
  echo "dtoverlay=dwc2" | sudo tee -a /boot/firmware/config.txt
fi
if ! sudo grep -xqs "dwc2" /etc/modules; then
  echo "dwc2" | sudo tee -a /etc/modules
fi
if ! sudo grep -xqs "libcomposite" /etc/modules; then
  echo "libcomposite" | sudo tee -a /etc/modules
fi

#Set hostname
sudo hostnamectl set-hostname pizerowframe
sudo touch /usr/share/pizerowframe/reboot

#Almost done!
echo
echo Pi Zero W Frame can now be configured with your web browser pointed at http://$ipaddress. Use \"pizerowframe\" to log in and be sure to change the password!
echo
read -p "Press [Enter] key to continue..."
echo
