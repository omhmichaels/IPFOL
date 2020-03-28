#!/bin/bash
# Author: SomhmxxGhoul

# Get log path or use default
log_path=${1:- '/var/log/'}


# Grep ip addresses
grep -r  -E -n -o -T "([0-9]{1,3}[\.]){3}[0-9]{1,3}" $log_path | awk -F":" '{print $3}' >> ips.txt

while read -r line; do
    # Get iplocation from ipinfo
    country=$(curl -s http://ipinfo.io/${line} | grep country | awk -F: '{print $2}')

    # Print Ips and Countrys into file
    printf "\nFound:\n\tIP: $line\n\tCountry: $country\n" >> ips-countrys-found.log;
done <ips.txt 

# Remove ips file
rm ips.txt;

# Check File created
cat ips-countrys-found.log