#!/bin/bash
#This script is on variables
readonly name=venugopal #this makes variable constant
echo "My name is $name"
echo "Host Name is $(hostname)" # it prints host-name
name=Jhansi  #here value will not change because variable is declared as readonly
echo "My wife name is $name" 



