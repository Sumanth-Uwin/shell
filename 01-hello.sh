#!/bin/bash
Start_time=$(date +%s)
read -s Person1
echo "Recieved Input"
read -s Person2
echo "Recieved Input"
echo "$Person1: Hey $Person2 we are going to blast you"
echo "$Person2: Come lets have some fun"
End_time=$(date +%s)
Total_Time=$(($End_time-$Start_time))
sleep 2
echo "Runtime: $Total_time"