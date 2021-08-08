#!/bin/sh

# Check that the wifi is still running and connected

# Create a failure counter
wlan_failuires=0
failure_limit=10
loop_sleep_time=2

# Log start of script
logger "Starting WLAN watcher"

# While the failure count is less than the allowed limit keep checking the interface
while [ "$wlan_failuires" -lt "$failure_limit" ];
do
    # Check the status of nmcli
    nmcli con show --active | grep -q wlan0

    # Test the output of the nmcli command
    if [ "$?" -ne 0 ];
    then 
        logger "WLAN is down by the looks, rebooting whole system..."
        wlan_failuires=$((wlan_failuires+1))
    fi

    # sleep for alloted time
    sleep "$loop_sleep_time"
done

# On failure restart the device
logger "Hit program end, rebooting..."
sudo reboot