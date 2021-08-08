#!/bin/sh

# Stop the service if it exists 
systemctl is-active --quiet wlan_watcher.service
if [ $? -eq 0 ];
then
    printf "Stopping previous versions of the service ... "
    systemctl stop wlan_watcher.service
    printf "done\n"
fi

# Copy the service file into /etc/systemd/system
printf "Creating service file in /etc/systemd/service ... "
cp ./wlan_watcher.service /etc/systemd/system/wlan_watcher.service
printf "done\n"

# Copy the main script into /usr/bin
printf "Creating script file in /usr/bin ... "
cp ./wlan_watcher.sh /usr/bin/wlan_watcher.sh
chmod u+x /usr/bin/wlan_watcher.sh
printf "done\n"

# Start the service 
printf "Starting service as wlan_watcher ... "
sudo systemctl start wlan_watcher.service
printf "done\n"

# Allow it to run at boot
printf "Allowing service to run at boot ... "
sudo systemctl enable --now wlan_watcher.service
printf "done\n"

# Reload daemon
printf "Reloading Daemon ... "
systemctl daemon-reload
printf "done\n"