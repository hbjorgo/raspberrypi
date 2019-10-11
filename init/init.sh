#!/bin/bash

### Hostname ###
read -p "Do you want to set hostname? [y/N] " prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
    read -p "Please enter new hostname: " hostnamevar
    hostname $hostnamevar
    echo "Hostname set to $hostnamevar"
fi

### Update ###
echo "Updating installed software..."
apt-get update
apt-get -y upgrade
echo "Done"