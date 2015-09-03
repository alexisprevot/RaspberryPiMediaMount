#!/bin/bash

### BEGIN INIT INFO
# Provides:          RaspberryPiMediaMount.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

# Script de montage pour disque dur freebox + usb

echo "your_password" | sudo -S mount -t vfat /dev/sda1 /media/usb/;

if [ $? -eq 0 ]; then
    echo -e '[ \e[32mok\e[0m ] Usb key mounted'
else
    echo -e '[\e[31mwarn\e[0m] The USB key is not mounted'
fi

echo "your_password" | sudo -S mount /media/freebox/;

if [ $? -eq 0 ]; then
    echo -e '[ \e[32mok\e[0m ] Freebox HD mounted'
else
    echo -e '[\e[31mwarn\e[0m] Freebox HD is not mounted'
fi

exit 0
