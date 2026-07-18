#!/bin/bash 
USERID=$(id -u)
SOFTWARE=$1
if [ $USERID -ne 0 ]; then
echo "run with sudo cmd"
exit 1
fi

echo "checking if it is already installed or not $(($(SOFTWARE) --version))"
if [ $? -eq 0 ]; then 
    echo "$(SOFTWARE) is already installed successfully"
else 
echo "$(SOFTWARE) is not installed, installing $(SOFTWARE)"
fi
dnf install $(SOFTWARE) -y

if [ $? -eq 0 ]; then 
    echo "$(SOFTWARE) installed successfully"
else
    echo "failed to install $(SOFTWARE) & error code is $(($?))"
    exit 1
fi
