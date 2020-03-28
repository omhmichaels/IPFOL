#!/bin/bash
read $1
echo "-------------------------------------------"
grep  -E -n -o -T "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $1 |awk '{print  "IP address " $2 $3 " found" " on line # "  $1 }' | sed 's/:/ /g'
echo "--------------------------------------------"
read -p "Press [Enter] to exit..."
