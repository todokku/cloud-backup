import os
# Install rclone static binary
os.system('wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip')
os.system('unzip -q rclone-v1.51.0-linux-amd64.zip')
os.system('export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH')

os.system('echo "Installing rclone..."')
os.system('echo $PATH')

os.system('echo 1')
os.system('if [[ -n $RCLONE_CONFIG_FILE && -n $RCLONE_FIRST_COMMAND ]]; then')
os.system('echo "Rclone config detected"')
os.system('echo -e "$RCLONE_CONFIG_FILE" > rclone.conf')
	# RClone Config file 
os.system('fi')
os.system('echo 2')
os.system('rclone')
os.system('{ eval $RCLONE_FIRST_COMMAND }&')
os.system('echo 3')
os.system('{ eval $RCLONE_SECOND_COMMAND }&')
os.system('echo 4')
os.system('{ eval $RCLONE_THIRD_COMMAND }&')
os.system('echo 5')
os.system('{ eval $RCLONE_FOURTH_COMMAND }&')
os.system('echo 6')
os.system('{ eval $RCLONE_FIFTH_COMMAND }&')
