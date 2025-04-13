#!/bin/bash
# Log Rotation script
# Author: Venugopal Reddy
# Purpose: Rotate logs in a directory, compress old logs, and cleanup older backups.

# Check the logs directory exists?, and if not throw an error
if [[ -d logs ]]; then
    echo "Logs directory(logs) exists"
else
    echo "ERROR: Log directory(logs) doesn't exists. Exiting."
    exit 1
fi