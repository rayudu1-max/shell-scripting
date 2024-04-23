#!/bin/bash

echo "Enter the number"

read NUMBER

if [ $NUMBER -gt 15 ]
then
    echo "$NUMBER is greater than 15"
else if [ $NUMBER -eq 15]
    echo "$NUMBER is equal to 15"
else
    echo "$NUMBER is lesser than 15"
fi
