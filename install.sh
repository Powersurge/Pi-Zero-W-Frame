#########################################################################
#Pi Zero W Frame                                                        #
#This script will install Apache, PHP, and MySQL.                       #
#This script was written by Chris Newell                                #
#[C] 2023 Chris Newell: See LICENSE.md for details                      #
#########################################################################

#!/bin/bash

#Prerequisites
sudo apt-get update

#Apache
sudo apt-get install -y apache2
sudo echo "ServerName localhost" >> /etc/apache2/httpd.conf

#PHP
sudo apt-get install -y php5 libapache2-mod-php5 php5-intl php5-mcrypt php5-curl php5-gd php5-sqlite

#MySQL
sudo apt-get install -y mysql-server mysql-client php5-mysql

#Additional Dependencies
sudo apt-get install -y nmap zenmap
