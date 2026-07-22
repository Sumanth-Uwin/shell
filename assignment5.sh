#!/bin/bash
flag=0

validate(){
    if [ $? -eq 0 ]; then
    echo "SUCCESS"
    #flag=0
    else
        echo "FAILURE"
        flag=1
    fi
}

ls /tmp
validate
ls /fakedir
validate
ping -c1 google.com
validate
if [ $? -eq 0 ]; then
    echo "Host reachable"
else
    echo "Host not reachable"
fi
echo "$flag"

