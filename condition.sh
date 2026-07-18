#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 10 ]; then
    echo "The Number $NUMBER is greater than 10"
else
    echo "Number $NUMBER is less than 10"
fi