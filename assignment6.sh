#!/bin/bash
#number=$1

prime(){
    if [ $(( $1 % 2 )) -eq 0 ]; then
        echo "$1 is even"
    else
        echo "$1 is odd"
    fi
}

prime $1