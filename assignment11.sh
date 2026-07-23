#!/bin/bash
LOG_DIR="/home/ec2-user/shell-logs"
FILE_NAME_Success="$LOG_DIR/tmp/script_success.log"
FILE_NAME_Failure="$LOG_DIR/tmp/script_failure.log"
ls /tmp 1>> $FILE_NAME_Success 2>> $FILE_NAME_Failure
ls /fakedir 1>> $FILE_NAME_Success 2>> $FILE_NAME_Failure
date 1>> $FILE_NAME_Success 2>> $FILE_NAME_Failure
echo "Success Log"
cat "$LOG_DIR/tmp/script_success.log"
echo "Failure Log"
cat "$LOG_DIR/tmp/script_failure.log"
