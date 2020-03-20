#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

echo "Installing rclone..."
echo $PATH

if [[ -n $RCLONE_CONFIG_FILE ]]; then
    echo "Rclone config detected"
    echo -e "$RCLONE_CONFIG_FILE" > rclone.conf
	# RClone Config file 
fi
echo "Reading config file..."
rclone --config="rclone.conf" listremotes 

echo "Sync supertemp->chicago..."
rclone --config="rclone.conf" sync "supertemp:" "chicago:"
