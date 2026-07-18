#!/bin/bash 
USERID=$(id -u)
SOFTWARE=$1
LOG_DIR="/home/ec2-user/shell-logs"
FILE_NAME="$LOG_DIR/$0.log"
if [ $USERID -ne 0 ]; then
echo "run with sudo cmd"
exit 1
fi

VALIDATE(){
    if [ $2 -eq 0 ]; then
            echo "$1 installed successfully"
        else
            echo "failed to install $1 & error code is $?"
            exit 1
        fi
}

echo "checking if it is already installed or not"
dnf list installed $SOFTWARE &>> $FILE_NAME
if [ $? -eq 0 ]; then
    echo "$SOFTWARE is already installed skipping"
else
    echo "$SOFTWARE is not installed, installing $SOFTWARE"
    dnf install $SOFTWARE -y &>> $FILE_NAME
    VALIDATE $SOFTWARE $?
fi