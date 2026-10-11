#!/bin/bash
Start_time=$(date +%s)
read -s Person1
echo "Recieved Input"
read -s Person2
echo "Recieved Input"
echo "$Person1: Hey $Person2 we are going to blast you"
echo "$Person2: Come lets have some fun"
sleep 2
End_time=$(date +%s)
Total_time=$(($End_time-$Start_time))
echo "Runtime: $Total_time"