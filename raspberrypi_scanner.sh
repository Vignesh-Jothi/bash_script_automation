#!/bin/bash

# Function to check if Nmap is installed
check_nmap() {
    if ! command -v nmap &> /dev/null; then
        echo "Nmap could not be found. Please install Nmap to use this script."
        exit 1
    fi
}

# Function to prompt user for network range and run Nmap scan
scan_network() {
    # Prompt user for network range to scan
    read -p "Enter your NETWORK_IP (e.g., 192.168.1.0/24): " NETWORK_RANGE

    # Validate user input for network range format
    if [[ ! $NETWORK_RANGE =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}$ ]]; then
        echo "Invalid network range format. Please enter a valid CIDR notation (e.g., 192.168.1.0/24)."
        sleep 0.5 
        scan_network
    fi

    # Run the Nmap scan
    echo "Scanning network for Raspberry Pi devices..."
    nmap -sn $NETWORK_RANGE | grep -B 2 "Raspberry Pi Foundation" | grep "Nmap scan report for" | awk '{print $5}' | while read -r ip; do
        echo "Raspberry Pi found at IP: $ip"
    done
}

# Check if Nmap is installed
check_nmap

# Run network scan
scan_network

echo "Scan complete."
