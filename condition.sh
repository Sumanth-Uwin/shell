#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 10 ]; then
    echo "The Number $NUMBER is greater than 10"
elif[ $NUMBER -gt 20]; then
    echo "The number is greater than 20"
else
    echo "Number $NUMBER is less than 10"
fi