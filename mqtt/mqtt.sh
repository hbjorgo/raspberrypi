#!/bin/bash

### Install ###
echo "Installing Mosquitto..."
apt-get install mosquitto mosquitto-clients
echo "Done"

### Configuration ###
echo "Writing configuration..."
echo "allow_anonymous false" | tee -a /etc/mosquitto/conf.d/custom.conf
echo "password_file /etc/mosquitto/users" | tee -a /etc/mosquitto/conf.d/custom.conf
echo "Done"

### Create username and password file ###
echo "Setting up username and password..."
mosquitto_passwd -c /etc/mosquitto/users mqttbroker
echo "Done"

### Run on background as a daemon ###
echo "Running Mosquitto as daemon..."
mosquitto -d
echo "Done"