#!/bin/bash
header=$1

print_header(){
    echo "===================="
    echo "$header"
    echo "===================="
}

check_status(){
    if [ $2 -eq 0 ]; then
        echo "SUCCESS: $1 installed"
    else
        echo "FAILURE: $1 Failed Error code: $?"
        exit 1
    fi
}

install_package(){
    package_name=$1
    dnf list installed $package_name &>> $FILE_NAME
    if [ $? -eq 0 ]; then
        #echo "$package_name is already installed. Skipping installation."
        check_status $package_name $?
        exit $?
    else
        #echo "$package_name is not installed. Installing $package_name..."
        dnf install $package_name -y &>> $FILE_NAME
        if [ $? -eq 0 ]; then
            check_status $package_name $?
            exit $?
        else
            check_status $package_name $?
            exit 1
        fi
    fi
}

install_package git
install_package wget
install_package curl