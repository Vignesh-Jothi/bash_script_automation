# Raspberry Pi Network Scanner

## Overview
This Bash script scans a specified network range to identify Raspberry Pi devices using nmap.

## Requirements
- nmap installed 

## Usage
1. Clone or download the script.
2. Make the script executable: `chmod +x raspberrypi_scanner.sh`
3. Run the script: `./raspberrypi_scanner.sh`
4. Enter the network range when prompted (e.g., `192.168.1.0/24`).

## Functionality
- Checks if nmap is installed.
- Prompts the user to enter a network range to scan.
- Executes an nmap scan to find devices identified as Raspberry Pi.
- Displays the IP addresses of discovered Raspberry Pi devices.

## Example
```
$ ./raspberrypi_scanner.sh
Enter your NETWORK_IP (e.g., 192.168.1.0/24): 192.168.1.0/24
Scanning network for Raspberry Pi devices...
Raspberry Pi found at IP: 192.168.1.10
Raspberry Pi found at IP: 192.168.1.20
Scan complete.
```

## Notes
- Ensure you have proper permissions and network access to perform the scan.
- Customize the script as needed for your specific network environment.

---
