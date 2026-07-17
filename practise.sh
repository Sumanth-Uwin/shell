#!/bin/bash
echo "Hello, Sumanth!"
echo "Print used variables : $@"
echo "count used variables : $#"
echo "Print all used variables : $*"
echo "Print 1st argument :$1"
echo "Print script name : $0"
echo "print user name : $USER"
echo "print current working dir : $PWD"
echo "print home dir : $HOME"
echo "print PID of current shell : $$"
sleep 5
echo "pid of baclkground process : $!"
wait $!
echo "print line number :$LINENO"
