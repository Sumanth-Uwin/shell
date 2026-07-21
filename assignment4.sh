#!/bin/bash
echo "Running as     :$USER"
echo "Directory      :$PWD"
echo "Home           :$HOME"
echo "Script PID     :$$"
sleep 5 &
echo "Background PID :$!"
echo "Random number  :$RANDOM"
echo "Script ran in sec :$SECONDS"