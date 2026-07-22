#!/bin/bash

day_check(){
    if [ $1 -eq "Saturday" ] || [ $1 -eq "Sunday" ]; then
        echo "Weekend! Enjoy your holiday."
    elif [ $1 -eq "Monday" ]; then
        echo "Start of the week. Let's go!"
    else 
        echo "Weekday. Go to school/work."
    fi
}

day_check $(date +%A)