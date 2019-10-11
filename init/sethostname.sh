#!/bin/bash

read -p "Please enter new hostname: " hostnamevar
echo $hostname >> /etc/hostname
sed -i 's/raspberrypi/$hostname/g' /etc/hosts
hostnamectl set-hostname "$hostname"
systemctl restart avahi-daemon
echo "Hostname set to $hostnamevar"