# wlan-watcher

A simple linux service to watch the state of the WLAN adapter and reboot on failures

## Motivation

This simple sets of scripts allows a user to watch the status of a wireless interface using `nmcli` to detect when the interface is down.

The current use case it to watch unreliable hardware on SBC's which do not respond to module reloads and thus need a hardware reboot in order to come back online. Usually these SBC's are remote so when the interface goes down it needs to come back up as soon as possible. When hardware is the issue, this was foudn to be the most reliable method.

## How to run 

To run simply download this repo and run the `create_service.sh` script:

``` shell

$ git clone https://github.com/thebigpotatoe/wlan-watcher.git
$ cd wlan-watcher
$ sudo /bin/sh create_service.sh

```

Or as a one liner:

`git clone https://github.com/thebigpotatoe/wlan-watcher.git && cd wlan-watcher && sudo /bin/sh create_service.sh`

Thats it!

## Modifying the script

There are 2 variables in the `wlan_watcher.sh` script which can be editted. These are:

- failure_limit - The numebr of failures before the script determines the interface is down
- loop_sleep_time - The sleep period in seconds between checking the interface
