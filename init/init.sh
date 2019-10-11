#!/bin/bash

### Hostname ###
read -p "Do you want to set hostname? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    read -p "Please enter new hostname: " hostnamevar
    hostname $hostnamevar
    echo "Hostname set to $hostnamevar"
else
    echo "Skipped setting hostname"
fi

### Update ###
echo "Updating installed software..."
apt-get update
apt-get -y upgrade
echo "Done"