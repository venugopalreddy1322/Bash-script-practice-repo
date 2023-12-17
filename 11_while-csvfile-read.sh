#!/bin/bash
# Reading values from .csv file using while loop

while IFS="," read id name age #IFS field separater here we gave ,
do
	echo "$id"
	echo "$name"
	echo "$age"
done < ./test.csv


