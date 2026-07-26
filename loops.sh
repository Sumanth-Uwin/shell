#!/bin/bash
#!/bin/bash 
USERID=$(id -u)
SOFTWARE=$1
Time=$(date +%Y-%m-%d_%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
LOG_DIR="/home/ec2-user/shell-logs"
FILE_NAME="$LOG_DIR/$0.log"
if [ $USERID -ne 0 ]; then
echo -e "${R}run with sudo cmd${W}"
exit 1
fi

VALIDATE(){
    if [ $2 -eq 0 ]; then
            echo -e $Time "${G}$1 [INFO] installed successfully${W}" | tee -a $FILE_NAME
        else
            echo -e $Time"${R}[ERROR] to install $1 & error code is $2${W}" | tee -a $FILE_NAME
            exit 1
        fi
}
for i in $@
do 
    echo -e $Time "${B}checking if it is already installed or not${W}" | tee -a $FILE_NAME
    dnf list installed $i &>>$FILE_NAME
    if [ $? -eq 0 ]; then
        echo -e $Time "${Y}$i is already installed skipping${W}" | tee -a $FILE_NAME
    else
        echo -e $Time "${C}$i is not installed, installing $i${W}"
                dnf install $i -y &>>$FILE_NAME
        VALIDATE $i $?
    fi
done