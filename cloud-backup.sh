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

echo "Clone tokyo->dallas..."
rclone --config="rclone.conf" sync "tokyo:" "crypt-dallas:" -vv

echo "Clone tokyo->cincinnati..."
rclone --config="rclone.conf" sync "tokyo:" "crypt-cincinnati:" -vv --exclude "*.CKSF"

echo "Clone tokyo->charleston..."
rclone --config="rclone.conf" sync "tokyo:" "crypt-charleston:" -vv

echo "Clone tokyo->pittsburg..."
rclone --config="rclone.conf" sync "tokyo:" "crypt-pittsburg:" -vv

echo "Clone tokyo->cleveland..."
rclone --config="rclone.conf" sync "tokyo:" "crypt-cleveland:" -vv --exclude "*.CKSF"

echo "Clone chicago->springfield..."
rclone --config="rclone.conf" sync "chicago:" "crypt-springfield:" -vv
