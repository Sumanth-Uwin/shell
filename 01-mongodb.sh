#!/bin/bash

LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LOGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOGS_FILE="$LOGS_FOLDER/$0.log"
Time=$(date +%Y-%m-%d_%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
 echo -e "$Time [ERROR] $R Please run this script with root access $W" | tee -a $LOGS_FILE
exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
            echo -e "$Time [INFO] $1 installed successfully" | tee -a $LOGS_FILE
        else
            echo -e "$Time [ERROR] Failed to install $1" | tee -a $LOGS_FILE
            exit 1
        fi
}
sed -n '
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/x86_64/
enabled=1
gpgcheck=0
' /dev/null > /etc/yum.repos.d/mongo.repo

VALIDATE "MongoDB repo" $?
dnf install mongodb-org -y  | tee -a $LOGS_FILE
VALIDATE "MongoDB" $?
systemctl enable --now mongod | tee -a $LOGS_FILE
VALIDATE "MongoDB service" $?
sed -i 's/127.0.0.1/0.0.0.0' /etc/mongod.conf
VALIDATE "MongoDB bind address" $?
sytemctl restart mongod | tee -a $LOGS_FILE
VALIDATE "MongoDB restart" $?