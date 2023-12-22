#!/bin/bash
#####################
#This script is to list the current EC2 instances
#                                   S3 buckets
#                                   Iam Users
# And sends the output to resourseTrack.txt file
echo "List of Iam Users are:"
aws iam list-users | jq '.Users[].UserName' > resourceTrack.txt

echo "List of S3 Buckets are: " 
aws s3 ls >> resourceTrack.txt

echo "List of EC2 Instances: "
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTrack.txt

