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
shutdown -r 15