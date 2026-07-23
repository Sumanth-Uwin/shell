#!/bin/bash
server_name=$1
start_time=$(date +%s)

echo "========================"
echo "System Info Report — $server_name"
echo "========================"
echo "Script PID: $$"
echo "started at: $start_time"
echo "User      : $WHOAMI"
echo "OS        : $(cat /etc/os-release | grep PRETTY)"
echo "Disk(/)   : $(df -h /)"
echo "Memory    : $(free -h)"
echo "Uptime    : $(uptime -p)"
echo "========================"
echo "Script completed in $(($(date +%s) - $start_time)) seconds"