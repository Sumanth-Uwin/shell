#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 10 ] && [ $NUMBER -lt 20 ]; then
    echo "The Number $NUMBER is greater than 10"
elif [ $NUMBER -gt 20 ] && [ $NUMBER -lt 30 ]; then
    echo "The number is greater than 20"
else
    echo "Number $NUMBER is less than 10"
fi