#!/bin/bash

day_check(){
    if [ $1 = "Saturday" ] || [ $1 = "Sunday" ]; then
        echo "Weekend! Enjoy your holiday."
    elif [ $1 = "Monday" ]; then
        echo "Start of the week. Let's go!"
    else 
        echo "Weekday. Go to school/work."
    fi
}

day_check $(date +%A)