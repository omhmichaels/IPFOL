#!/bin/bash
#this script only works using one(1) file at a time
#place your log files in the logdir directory
echo Please enter a filename [ie:mylog.txt] to look for IP addresses:
cd logdir
read myfilename
echo "-------------------------------------------"
grep -E -n -o -T "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $myfilename |awk '{print "IP address " $2 $3 " found" " on line # "  $1 }' | sed 's/:/ /g'
# -H prints filename
# -T --initial-tab?
echo "--------------------------------------------"
read -p "Press [Enter] to exit..."
