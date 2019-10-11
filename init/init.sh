#!/bin/bash

echo "Updating installed software..."
apt-get update
apt-get -y upgrade
echo "Done"
echo "Please enter new hostname:"
read -p 'Hostname: ' hostnamevar
echo "Hostname set to $hostnamevar"