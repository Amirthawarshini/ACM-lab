$path = "C:\Windows\Temp"
$thresholdSizeMB = 2
$daysThreshold = 15
$cutoffDate = (Get-Date).AddDays(-$daysThreshold)

Get-ChildItem -Path $path -Recurse -File | 
    Where-Object { $_.Length -gt ($thresholdSizeMB * 1MB) -and $_.LastWriteTime -ge $cutoffDate } | 
    Select-Object Name, 
                  @{Name="Size(MB)";Expression={[math]::Round($_.Length / 1MB, 2)}}, 
                  LastWriteTime | 
    Format-Table -AutoSize