#!/bin/bash
# A project to compress and move files to specified directorty(archive), 
# which are modified 10 days ago and larger than 20MB

#set -x  #Debugging
set -e  # Exit if any command failed to execute
#variables
path=/workspaces/shellscript-youtube
DEPTH=1
RUN=0

# step1: check weather the given directory exists, if not exit

if [[ ! -d $path ]]
then
    echo "Directory not exist: $path"
    exit 1
fi

#step2: check weather the archive folder exists? if not create one
# in this example i am creating archive folder under projects-shellscript folder.

if [[ ! -d $path/projects-shellscript/archive ]]
then
    #echo "archive Directory not exist; creating ..."
    mkdir $path/projects-shellscript/archive
fi

#step3: find files larger than (+20M) 20 MB; (-20M : file size less than 20 mb)
#-mtime +10: file modified 10 days befor(-ctime:change time,, etc)
#

for i in $( find $path -maxdepth $DEPTH -type f -mtime +10 -size +20M)
 # here DEPTH is how deep to search- here just level 1
do 
    if [[ $RUN -eq 0 ]]
    then
        echo "Moving $i file to archive"
        gzip $i || exit 1
        mv $i.gz $path/projects-shellscript/archive || exit 1
    fi
done
