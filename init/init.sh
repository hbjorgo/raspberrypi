#!/bin/bash

### Hostname ###
read -p "Do you want to set hostname? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    read -p "Please enter new hostname: " hostnamevar
echo $hostname > /etc/hostname
sed -i "s/raspberrypi/$hostname/g" /etc/hosts
hostnamectl set-hostname "$hostname"
systemctl restart avahi-daemon
echo "Hostname set to $hostnamevar"
else
    echo "Skipped setting hostname"
fi

### Update ###
echo "Updating installed software..."
apt-get update
apt-get -y upgrade
echo "Done"

### Reboot ###
read -p "Do you want to reboot? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    echo "Shutting down..."
    shutdown -r now
else
    echo "Done"
fi