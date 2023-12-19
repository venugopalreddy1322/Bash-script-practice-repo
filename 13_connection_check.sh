#!/bin/bash
# connectivity check using ping command

read -p "Enter site name to check connectivity: " site

#ping -c 1 $site # to send only 1 packet

ping $site

if [[ $? -eq 0 ]]
then
	echo "Successfully connected to $site"
else
	echo "Failed to connect to $site"
fi

