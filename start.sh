#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

echo "Installing rclone..."
echo $PATH

echo 1
if [[ -n $RCLONE_CONFIG_FILE && -n $RCLONE_FIRST_COMMAND ]]; then
    echo "Rclone config detected"
    echo -e "$RCLONE_CONFIG_FILE" > rclone.conf
	# RClone Config file 
fi
echo 2
rclone --config="rclone.conf" config
{
    eval $RCLONE_FIRST_COMMAND
}&
echo 3
{
    eval $RCLONE_SECOND_COMMAND
}&
echo 4
{
    eval $RCLONE_THIRD_COMMAND
}&
echo 5
{
    eval $RCLONE_FOURTH_COMMAND
}&
echo 6
{
    eval $RCLONE_FIFTH_COMMAND
}&
