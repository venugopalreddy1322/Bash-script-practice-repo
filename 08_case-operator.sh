#!/bin/bash

echo "provide an option:"
echo "a for Print date"
echo "b for print list of scripts/files-'ls'"
echo "c for print Present working directory-'pwd'"

read choice

case $choice in
	a)
		echo "Current Date is: "
		date
		echo "Done"
		;;
	b)ls;;
	c)
		echo "Present working directory is: "
		pwd
		;;
	*)echo "Choose valid option....a/b/c"
esac

