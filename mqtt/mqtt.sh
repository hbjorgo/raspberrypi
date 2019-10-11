#!/bin/bash

### Install ###
apt-get install mosquitto mosquitto-clients

### Enable broker ###
systemctl enable mosquitto

### Check broker status ###
systemctl status mosquitto