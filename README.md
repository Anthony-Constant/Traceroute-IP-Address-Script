# IP Address Traceroute Script

This PowerShell script automates the process of performing traceroute to multiple IP addresses, each in a new command prompt window, and logs the results to individual files.

## Introduction

This script is designed to help network administrators and IT professionals easily perform traceroute to a list of IP addresses. Each traceroute is executed in a separate command prompt window, allowing for detailed analysis of network routing paths. The results of each traceroute session are logged to individual text files.

## How It Works

The script defines a list of IP addresses to perform traceroute. It then uses a function to open a new command prompt window for each IP address and execute the traceroute (`tracert`). The output of each traceroute session is logged to a separate file named `TracerouteLog_<IP>.txt`, where `<IP>` is the respective IP address.

## Features

- Performs traceroute to multiple IP addresses concurrently.
- Opens a new command prompt window for each traceroute.
- Logs results of each traceroute session to individual files.

## Dependencies

- PowerShell

## Getting Started

1. **Edit the Script:**
   - Open the script file (`traceroute_script.ps1`) in a text editor.
   - Modify the list of IP addresses (`$ipAddresses`) to your desired IP addresses.
   - Save the script file.

2. **Run the Script:**
   - Open PowerShell.
   - Navigate to the directory where the script file is located using the `cd` command:
     ```powershell
     cd path\to\your\script\directory
     ```
   - Execute the script using the following command:
     ```powershell
     .\traceroute_script.ps1
     ```

3. **Monitor the Traceroutes:**
   - Each IP address in the list will have a traceroute performed in a new command prompt window.
   - The results of each traceroute session will be logged to a file named `TracerouteLog_<IP>.txt` in the script's directory.

## Demo
https://youtu.be/DkBbCKkOeJY

## Script

```powershell
#---------------------------------------------------------------------------------------#
# Title: Traceroute IP Address Script                                                   #
# Description: Easily traceroute a list of IP addresses and log results to files        #
# Author: AC                                                                            #
#---------------------------------------------------------------------------------------#


# List of IP addresses to perform traceroute
$ipAddresses = @(
    "192.168.100.1",
    "10.10.10.10",
    "10.10.20.10",
    "10.10.30.10"
)

# Function to perform traceroute and log the output to a file
function Traceroute-IP {
    param (
        [string]$ip
    )
    
    $logFile = "TracerouteLog_$ip.txt"
    $script = "powershell -NoExit -Command `"tracert $ip | Tee-Object -FilePath $logFile`""

    # Start a new command prompt window and run the traceroute command
    Start-Process "cmd.exe" -ArgumentList "/c start cmd.exe /k $script"
}

# Loop through the list of IP addresses and perform traceroute in a new command prompt window
foreach ($ip in $ipAddresses) {
    Traceroute-IP -ip $ip
}

Write-Host "Traceroute commands executed in new command prompt windows."
