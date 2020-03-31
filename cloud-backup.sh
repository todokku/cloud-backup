#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

echo "Installing rclone..."
echo $PATH

if [[ -n $RCLONE_CONFIG_FILE ]]; then
    echo "Rclone config detected"
    wget $RCLONE_CONFIG_FILE -O rclone.conf
	# RClone Config file 
fi
echo "Reading config file..."
rclone --config="rclone.conf" listremotes 

echo "Custom command..."
eval $CUSTOM_COMMAND

#echo "Deduping chicago..."
#rclone --config="rclone.conf" dedupe "chicago:"
echo "Clone chicago->tokyo..." #OneDrive
rclone --config="rclone.conf" move "chicago:" "tokyo:" -v --exclude "*.CKSF"

echo "Clone tokyo->dallas..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-dallas:" -v

echo "Clone tokyo->cincinnati..." #OneDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-cincinnati:" -v --exclude "*.CKSF"

echo "Clone tokyo->charleston..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-charleston:" -v

echo "Clone tokyo->pittsburg..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-pittsburg:" -v

echo "Clone tokyo->cleveland..." #OneDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-cleveland:" -v --exclude "*.CKSF"

echo "Clone chicago->springfield..." #GDrive
rclone --config="rclone.conf" sync "chicago:" "crypt-springfield:" -v

echo "Clone chicago->kiev..." #OneDrive
rclone --config="rclone.conf" sync "chicago:" "crypt-kiev:" -v --exclude "*.CKSF"
