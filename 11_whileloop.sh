#!/bin/bash

# while-loop
#########################################
count=1
num=10
while [[ count -le num ]]
do
	echo "count value is: $count"
	let count++
done
#########################################
# until-loop
# opposite to while loop, it executes until condition true

a=10
until [[ $a -eq 0 ]]
do
	echo "a value is: $a"
	let a-- # can also use let a--
done

##########################################
# Infinite-loop: runs continuesly
while true   # for (( ; ; ))
do
	echo " hello world"  # prints hello world every 2 seconds
	sleep 2s
done


