#!/bin/bash
# Log Rotation script
# Author: Venugopal Reddy
# Purpose: Rotate logs in a directory, compress old logs, and cleanup older backups.

# Check the logs directory exists?, and if not throw an error
LOG_DIR=logs
# read -rp "Enter the log directory path: " LOG_DIR
BACKUP_DIR=backup
RETENTION_DAYS=1
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
        # Update the log file name with timestamp
        backup_file="${base_name%.*}_${timestamp}.log"
        mv $log_file $BACKUP_DIR/$backup_file
        echo "Archieved $log_file"
    else
        echo "Ignored $log_file as it is Directory"
    fi
done
# Compress/zip logs in the backup directory.
if ls $BACKUP_DIR/*.log 1> /dev/null 2>&1; then
    echo "Compressing log files in Backup Directory"
    zgip $BACKUP_DIR/*.log
    echo "Done with Compression"
else
    echo "No logs to Compress"
# Clean up old logs that are older than a certain number of minute(s).
echo "Cleaning up backup logs older than $RETENTION_DAYS Day(s)..."
find $BACKUP_DIR -type f -name "*.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \; #use -mmin for testing
echo "Log Rotation completed Successfully .."  
