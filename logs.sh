#!/bin/bash 
#LOG_DIR="/home/ec2-user/shell-logs"
#FILE_NAME="$LOG_DIR/$0.log"
Software=$1
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo"Run as admin user"
    exit 1
fi

Validate(){
    if [ $2 eq 0 ]; then
        echo "$Software installed successfully"
    else
        echo  "$Software not installed"
    fi
}

dnf list installed $Software
if [ $? -eq 0 ]; then
    echo "$Software has been already installed"
else
    dnf install $Software -y
fi

Validate $Software $?


