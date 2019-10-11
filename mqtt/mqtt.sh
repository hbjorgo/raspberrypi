#!/bin/bash

### Install ###
apt-get install mosquitto mosquitto-clients

### Configuration ###
echo "allow_anonymous false" | tee -a /etc/mosquitto/conf.d/custom.conf
echo "password_file /etc/mosquitto/users" | tee -a /etc/mosquitto/conf.d/custom.conf

### Create username and password file ###
mosquitto_passwd -c /etc/mosquitto/users mqttbroker

### Enable broker ###
systemctl enable mosquitto

### Check broker status ###
systemctl status mosquitto