#!/bin/bash

# Function to check if nmap is installed
check_nmap() {
    if ! command -v nmap &> /dev/null
    then
        echo "nmap could not be found. Please install nmap to use this script."
        exit 1
    fi
}

# Check if nmap is installed
check_nmap

# Define the network range to scan
echo -n "Enter your NETWORK_IP: "

read NETWORK_RANGE

# Run the nmap scan
echo "Scanning network for Raspberry Pi devices..."
nmap -sn $NETWORK_RANGE | grep -B 2 "Raspberry Pi Foundation" | grep "Nmap scan report for" | awk '{print $5}' | while read -r ip; do
    echo "Raspberry Pi found at IP: $ip"
done

echo "Scan complete."
