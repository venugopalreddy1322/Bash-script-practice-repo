#!/bin/bash
# Log Rotation script
# Author: Venugopal Reddy
# Purpose: Rotate logs in a directory, compress old logs, and cleanup older backups.

# Check the logs directory exists?, and if not throw an error
LOG_DIR=logs
BACKUP_DIR=backup
if [[ -d $LOG_DIR ]]; then
    echo "Logs directory($LOG_DIR) exists"
else
    echo "ERROR: Log directory($LOG_DIR) doesn't exists. Exiting."
    exit 1
fi

# Create the Backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Rotate logs - get log files from the logs directory, append a timestamp, and move them to Backup directory
## Iterate through each file in logs directory
for log_file in $LOG_DIR/*.log; do
    if [[ -f $log_file ]]; then
        #echo $log_file
        # basename command extracts filename from path
        base_name=$(basename $log_file)
        timestamp=$(date +'%Y%m%d_%H%M%S')
        echo $timestamp
        # Update the log file name with timestamp
        backup_file="$base_name-$timestamp"
        echo $backup_file
    else
        echo "Ignored $log_file as it is Directory"
    fi
done
