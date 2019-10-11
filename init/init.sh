#!/bin/bash

### Password ###
read -p "Do you want to change password? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    passwd
else
    echo "Skipped changing password"
fi

### Hostname ###
read -p "Do you want to set hostname? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    read -p "Please enter new hostname: " hostname
    echo $hostname > /etc/hostname
    sed -i "s/raspberrypi/$hostname/g" /etc/hosts
    hostnamectl set-hostname "$hostname"
    systemctl restart avahi-daemon
    echo "Hostname set to $hostnamevar"
else
    echo "Skipped setting hostname"
fi

### Update ###
read -p "Do you want to update installed software? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    echo "Updating installed software..."
    apt-get update
    apt-get -y upgrade
    echo "Done"
else
    echo "Skipped updating"
fi

### Reboot ###
read -p "Do you want to reboot? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    echo "Shutting down..."
    shutdown -r now
else
    echo "Skipped rebooting"
fi