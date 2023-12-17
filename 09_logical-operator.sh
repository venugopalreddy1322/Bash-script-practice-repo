#!/bin/bash

read -p "Enter your Country: " country
read -p "Enter your Age: " age

if [[ $country == "India" ]] && [[ $age -ge 18 ]] # == use for STRING -eq use for NUMBERS
then
	echo "You can vote"
else
	echo "You can't vote"
fi

# Ternary operator
# condition1 && condition2 || condition3
# Execute condition2 only when condition1 is true else execute condition3

read -p "Enter your age: " a
[[ $a -ge 20 ]] && echo "Adult" || echo "Minor"
