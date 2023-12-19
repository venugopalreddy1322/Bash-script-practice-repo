#!/bin/bash
# To read only specific coloumn value in the file using AWK

cat ./test.csv | awk 'NR!=1 {print}' | while IFS="," read id name age
do
	echo "$id"
	#echo "$name"
	#echo "$age"
done

