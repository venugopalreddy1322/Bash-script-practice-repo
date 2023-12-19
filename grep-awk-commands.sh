#!/bin/bash
# Demo od grep and awk commands - are used to filter the output
# free - tells the memory details
# mt - megabyte Total

free -mt | grep "Total" | awk '{print $1, $4}'

