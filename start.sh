#!/bin/bash
echo 1
if [[ -n $RCLONE_CONFIG_FILE && -n $RCLONE_FIRST_COMMAND ]]; then
    echo "Rclone config detected"
    echo -e "$RCLONE_CONFIG_FILE" > rclone.conf
	# RClone Config file 
	RCLONE_CONFIG=rclone.conf
	export RCLONE_CONFIG
fi
echo 2
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
