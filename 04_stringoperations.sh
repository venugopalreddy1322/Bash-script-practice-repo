#!/bin/bash
# String Operations

var="Happy Birthday ShritanReddy Naregudem"
echo "$var"
length=${#var}
echo "Length of variable is: $length"

# Print variable value in upper case

echo " value in Uppercase:    ${var^^}"

# actual value in the var is not converted just printed the value in CAPITALS
echo " actual var value $var "

# print value in Lowecase

echo " value in lowecase:    ${var,,}"

# To replace a string

newvar=${var/Happy/"Very Happy"} # whenever string contains spaces use """/without quotes also worked
echo " Replaced text : $newvar"

# To slice of the string

echo "After slice : ${newvar:20:12}"

