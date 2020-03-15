#!/bin/bash

if [[ -n $RCLONE_CONFIG_FILE && -n $RCLONE_1ST_DESTINATION ]]; then
    echo "Rclone config detected"
    echo -e "$RCLONE_CONFIG_FILE" > rclone.conf
	# RClone Config file
	RCLONE_CONFIG=rclone.conf
	export RCLONE_CONFIG
fi

{
    eval $RCLONE_FIRST_COMMAND
}&
{
    eval $RCLONE_SECOND_COMMAND
}&
{
    eval $RCLONE_THIRD_COMMAND
}&
{
    eval $RCLONE_FOURTH_COMMAND
}&
{
    eval $RCLONE_FIFTH_COMMAND
}&
