#!/bin/bash
LOG_DIR="/home/ec2-user/shell-logs"
FILE_NAME="$LOG_DIR/$0.log"
user_id=$(id -u)
if [ $user_id -ne 0 ]; then
    echo "Please run the script as root user."
    exit 1
fi
package_name=$1
dnf list installed $package_name &>> $FILE_NAME
if [ $? -eq 0 ]; then
    echo "$package_name is already installed. Skipping installation."
    exit $?
else
    echo "$package_name is not installed. Installing $package_name..."
    dnf install $package_name -y &>> $FILE_NAME
    if [ $? -eq 0 ]; then
        echo "$package_name installed successfully."
        exit $?
    else
        echo "Failed to install $package_name. Error code: $?"
        exit 1
    fi
fi