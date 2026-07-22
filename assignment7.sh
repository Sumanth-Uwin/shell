#!/bin/bash

day_check(){
    if [ $1 = "Saturday" ] || [ $1 = "Sunday" ]; then
        echo "Today is $1 : Weekend! Enjoy your holiday."
    elif [ $1 = "Monday" ]; then
        echo "Today is $1 : Start of the week. Let's go!"
    else 
        echo "Today is $1 : Weekday. Go to school/work."
    fi
}

day_check $(date +%A)