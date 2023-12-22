#!/bin/bash
###############################
# This script outputs the node health
# version: 001
###############################

set -x # debugging mode
set -e # exits when command fails(error) to execute
set -o pipefail # when commnds in pipe falis

# disk space
df -h
echo
echo
# RAM -gt :gigabytes, total, l-shows in low and high memory statistics
free -lgt  # you can further filter by grep and awk according to your requirements
echo
echo
# no.of CPU
echo "Number of CPU are: "
nproc
echo
echo
# ps - all the processes running, -ef prints in full format
# here codespace is example- process running for codespace
ps -ef | grep codespace | awk -F" " '{print $2}'
