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
NETWORK_RANGE="192.168.1.0/24"

# Run the nmap scan
echo "Scanning network for Raspberry Pi devices..."
nmap -sn $NETWORK_RANGE | grep -B 2 "Raspberry Pi Foundation" | grep "Nmap scan report for" | awk '{print $5}' | while read -r ip; do
    echo "Raspberry Pi found at IP: $ip"
done

echo "Scan complete."
