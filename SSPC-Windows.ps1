#Gather basic system information, cores, threads, memory
$CORES = wmic cpu get numberofcores
$THREADS = wmic cpu get numberoflogicalprocessors
$RAM = wmic computersystem get totalphysicalmemory

#Take gathered system information and cut away useless characters, leaving only useful numbers/information
$cpuCount = "$CORES" | ForEach-Object { ([string]$_).Split("s")[1] } | ForEach-Object { ([string]$_).Split(" ")[4] }
$exThreads = "$THREADS" | ForEach-Object { ([string]$_).Split("s")[3] } | ForEach-Object { ([string]$_).Split(" ")[4] }
$Calc0 = "$RAM" | ForEach-Object { ([string]$_).Split("y")[2] } | ForEach-Object { ([string]$_).Split(" ")[4] }

#Calculate the amount of megabytes from bits
$Calc1 = "$([math]::Round($Calc0/1MB,2)) MB"
$maxMem = "$Calc1" | ForEach-Object { ([string]$_).Split(".")[0] }

#Get-Counter -ListSet 'GPU *'
#Gather gpu information if needed
#$GpuMemTotal = (((Get-Counter "\GPU Adapter Memory(*)\Total Committed").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
#Write-Output "Total GPU Process Memory Local Usage: $([math]::Round($GpuMemTotal/1MB,2)) MB"

#Forward all current information into file for copy & paste
echo "-vulkan(optional)" "-enableHT(optional)" "-noPause" "-cpuCount=$cpuCount" "-exThreads=$exThreads" "-maxMem=$maxMem" > Parameters.txt
(Get-Content -Path Parameters.txt) -join " " | Set-Content -Path Parameters.txt
