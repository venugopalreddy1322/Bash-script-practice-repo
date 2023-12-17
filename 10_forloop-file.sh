#!/bin/bash
######################################################
# Reading values from a file

file="./employee.txt"
for i in $(cat $file)
do
	echo "Employee names are: $i"
done

####################################################

# Reading values from file usung while-loop
while read j
do
	echo " Values read using whille-loop are: $j "
done < /c/Users/venug/learnlinux/youtube/employee.txt

####################################################
# Reading values from an array

#myArray=( 13 22 venu jhansi )
#length=${#myArray[*]}
#for (( i=0;i<=length;i++ ))
#do
#	echo " ${myArray[i]}"
#done

