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
