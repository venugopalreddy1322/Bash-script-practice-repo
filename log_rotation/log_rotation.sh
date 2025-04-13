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