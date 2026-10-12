#!/bin/bash 
LOG_DIR="/home/ec2-user/shell-logs"
FILE_NAME="$LOG_DIR/loops.log"
Software=$1
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo"Run as admin user"
    exit 1
fi

Validate(){
    if [ $2 -eq 0 ]; then
        echo "$1 installed successfully" | tee -a $FILE_NAME
    else
        echo  "$1 not installed" | tee -a $FILE_NAME
    fi
}

for i in $@
do
    dnf list installed $i &>> $FILE_NAME
    if [ $? -eq 0 ]; then
        echo "$i has been already installed" | tee -a $FILE_NAME
    else
        dnf install $i -y &>> $FILE_NAME
    fi

    Validate $i $?
done








