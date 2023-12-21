#!/bin/bash
# creating user, assigning password, must change password for 1st login
set -x
#step1: script should be executed by root user or sudo access
if [[ ${UID} -ne 0 ]]  # root or sudo UID=0
then
    echo "Please run with root/sudo"
    exit 1
fi

# Step2: user should provide at least 1 arguement as username else guide him/her
if [[ ${#} -lt 1 ]]           # ${#}-- gives no.of arguements
then
    echo "Usage: ${0} USER_NAME [COMMENT]..."     # ${0}-- script name
    echo "Create a user with name USER_NAME and comments field"
    exit 1
fi

# Step3: Take 1st arguement as username
USER_NAME=${1}
#echo "Username is:  $USER_NAME"

# step4: If there are more than one arguement treat them as comments
shift            # shift will exclude the 1st arguement
COMMENT="${@}"   # after SHIFT excluded, the rest of comments
                 # ${@}-- all arguements

# Step 5: create random password

PASSWORD=$(date +%S%p%N%Z)  # %S%p%N%Z-- just picked from date syntax to generate random password
#echo " $PASSWORD"

# Step 6: Create USER
useradd -c " ${COMMENT} " -m $USER_NAME

#Step 7: check whether USER created or not
if [[ ${?} -ne 0 ]]  # ${?}=0 if previous command executed sucessfuly
then
    echo "User not created "
    exit 1
fi
#Step 8: Assign Password to user
echo "$PASSWORD" | passwd "$USER_NAME"
# step 9: Check whether password assigned to user
if [[ ${?} -ne 0 ]]
then
    echo " Password couldn't be set to $USER_NAME "
    exit 1
fi
# Step 10: Enforce the user to change his password when he first log-in
passwd -e $USER_NAME

# Step 11: Print the User details
echo
echo
echo "Username : $USER_NAME"
echo
echo "Comments are : ${COMMENTS}"
echo
echo "Password :  $PASSWORD"
echo
echo "Host_Name : $hostname
# command to print all the users in linux
# cat /etc/passwd | cut -d: -f1
# cat /etc/passwd | awk -F : '{print $1}'- I tried this with the practicee of awk