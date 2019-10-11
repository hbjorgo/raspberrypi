#!/bin/bash

### Hostname ###
read -p "Do you want to set hostname? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    source ./sethostname.sh
else
    echo "Skipped setting hostname"
fi

### Update ###
echo "Updating installed software..."
source ./update.sh
echo "Done"

### Reboot ###
read -p "Do you want to reboot? [y/n]? " prompt
if [[ $prompt =~ [yY] ]]
then
    shutdownWaitTime = 1
    echo "Shutting down in $shutdownWaitTime minute(s)"
    shutdown -r +$shutdownWaitTime
else
    echo "Done"
fi