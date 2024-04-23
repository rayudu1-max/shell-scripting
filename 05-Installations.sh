#!/bin/bash

USERID=$(id -u)

echo "$USERID"

if [ $USERID -ne 0 ]
then
    echo "run the script with root access"
    exit 1
else 
    echo "you are a super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "installation status of MYSQL....FAILURE"
    exit 1
else
    echo "installation status of MYSQL....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "installation status of git....FAILURE"
    exit 1
else
    echo "installation status of git....SUCCESS"
fi

echo "script reached its end"
