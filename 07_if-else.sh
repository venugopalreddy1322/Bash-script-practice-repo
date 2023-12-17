#!/bin/bash
# if-else  and elif conditions

read -p "Enter your marks: " marks
echo "Your marks are:  $marks"

if [[ $marks -ge 80 ]]  # you can also use single[]
then
	echo "Passed with Distinction"
elif [[ $marks -ge 60 ]]
then
	echo "First Division"
elif [[ $marks -gt 50 ]]
then
	echo "Passed in 2nd Division"
else
	echo "You are failed, try hard for next time"
fi

