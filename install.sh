#########################################################################
#Pi Zero W Frame                                                        #
#This script will install Apache, PHP, and Rclone.                      #
#This script was written by Chris Newell                                #
#[C] 2023 Chris Newell: See LICENSE.md for details                      #
#########################################################################

#!/bin/bash
ipaddress=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/');

#Prerequisites
sudo apt-get update

#Apache
sudo apt-get install -y apache2
sudo echo "ServerName localhost" >> /etc/apache2/httpd.conf
sudo chown -R www-data:www-data /var/www/html

#PHP
sudo apt-get install -y php libapache2-mod-php

#Rclone
sudo apt-get install rclone

#Copy files from TAR file
sudo tar xvjf pizerowframe.tar.bz2 --no-overwrite-dir -C /

#Almost done!
echo
echo Pi Zero W Frame can now be configured with your web browser pointed at http://$ipaddress. Use \"pizerowframe\" to log in and be sure to change the password!
echo
read -p "Press [Enter] key to continue..."
echo
