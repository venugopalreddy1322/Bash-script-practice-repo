#!/bin/bash
# Array with Key - value

declare -A myArray
myArray=( [name]=venu [age]=38 [city]=Hyderabad )
echo " Details of Employ "
echo " Name : ${myArray[name]} Age : ${myArray[age]} City : ${myArray[city]} "

