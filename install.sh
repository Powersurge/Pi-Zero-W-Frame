#########################################################################
#Pi Zero W Frame                                                        #
#This script will install Apache, PHP, Python3, and Rclone.             #
#This script was written by Chris Newell                                #
#[C] 2023 Chris Newell: See LICENSE.md for details                      #
#########################################################################

#!/bin/bash
ipaddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/');

#Prerequisites
sudo apt-get update

#Apache
sudo apt-get install -y apache2
sudo chown -R www-data:www-data /var/www/html
sudo rm -f /var/www/html/*

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

#Watchdog
sudo apt-get install -y python3 python3-pip
sudo pip3 install watchdog
sudo systemctl daemon-reload
sudo systemctl enable usbshare.service
sudo systemctl start usbshare.service

#Almost done!
echo
echo Pi Zero W Frame can now be configured with your web browser pointed at http://$ipaddress. Use \"pizerowframe\" to log in and be sure to change the password!
echo
read -p "Press [Enter] key to continue..."
echo
