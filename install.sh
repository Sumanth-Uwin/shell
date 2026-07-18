#!/bin/bash 
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
echo "run with sudo cmd"
exit 1
fi

echo "installing mysql"
dnf install mysqll -y

if [ $? -eq 0 ]; then 
    echo "mysql installed successfully"
else
    echo "failed to install mysql & error code is $(($?))"
    exit 1
fi
