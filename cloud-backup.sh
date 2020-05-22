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

echo "Clone tokyo->lisbona..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "lisbona:" --exclude "*.CKSF" --delete-during --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose

echo "Clone tokyo->dallas..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-dallas:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during

echo "Clone tokyo->cincinnati..." #OneDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-cincinnati:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during

echo "Clone tokyo->charleston..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-charleston:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during

echo "Clone tokyo->pittsburg..." #GDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-pittsburg:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during

echo "Clone tokyo->cleveland..." #OneDrive
rclone --config="rclone.conf" sync "tokyo:" "crypt-cleveland:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during

echo "Clone chicago->springfield..." #GDrive
rclone --config="rclone.conf" sync "chicago:" "crypt-springfield:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --delete-during

echo "Clone chicago->kiev..." #OneDrive
rclone --config="rclone.conf" sync "chicago:" "crypt-kiev:" --fast-list --transfers=15 --checkers=20 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --exclude "*.CKSF" --delete-during
