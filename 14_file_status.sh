#!/bin/bash
# to check whether file or directory exist or not

a="/c/Users/venug/learnlinux/youtube/demo.txt"
if [[ -f $a ]]
then 
	echo "File exist"
else
	echo "Creating file"
	#exit 1  exit the script without creating a file
	touch $a
fi


