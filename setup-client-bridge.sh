#!/usr/bin/env bash

# Starting with a fresh install of the latest Raspberry Pi OS (lite version is fine)
# Configured with WiFi settings to connect to your home network with internet access.
# based on https://forums.raspberrypi.com/viewtopic.php?t=346633#p2076682

# check if running as root (via sudo)
if [[ $EUID -ne 0 ]]; then
	 echo "This script must be run as root" 
	 exit 1
fi


# ensure the "network-manager" package is installed
apt install -y network-manager

# enable the network-manager service
systemctl enable NetworkManager.service

# update the wired connection to share its internet connection
nmcli con modify "Wired connection 1" ipv4.method shared

