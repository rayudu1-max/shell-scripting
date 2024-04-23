#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ....FAILURE"
        exit 1
    else
        echo "$2 .....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run script as a root user"
    exit 1
else
    echo "you are a super user"
fi

dnf install mysqll -y
VALIDATE $? "MYSQL installation"

dnf install gitt -y
VALIDATE $? "git installation"