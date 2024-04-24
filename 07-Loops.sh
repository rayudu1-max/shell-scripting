#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE () {
if [ $1 -ne 0 ]
then
    echo -e "$2 ...$R FAILURE $N"
    exit 1
else
    echo -e "$2 ...$G FAILED $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run the script as a root user"
    exit 1
else
    echo "you are a super user"
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "Package $i is already Installed... $Y SKIPPED $N"
    else
        echo "Packege $i need to be installed"
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "$i installation"
    fi
done