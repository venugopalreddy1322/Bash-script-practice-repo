#!/bin/bash
# This script is on arrays

myArray=( 13 22 jhansi "venugopal reddy" 99.99 )

#to print all values in the array
echo "The array values are: ${myArray[*]}"

#to print specific value

echo "The first value in the array is: ${myArray[0]}"


echo "The last value af an array is: ${myArray[4]}"
# Length of an array

length=${#myArray[*]}
echo "Array Length is $length"

# to add more values to an array

myArray+=( Shritan Smaran ) #NOTE: These updated array values are not reflecting in the above script

echo "New array values after additin are: ${myArray[*]} "
# print values from specific index to no.of index values
echo " values from index 2 to 6 are: ${myArray[*]:2:6}"


