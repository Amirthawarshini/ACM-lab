$cutoffDate = (Get-Date).AddDays(-15)

Get-ChildItem "C:\AutomationLab" -Recurse -File |
Where-Object {
    ($_.Length -lt 2MB) -and
    ($_.LastWriteTime -gt $cutoffDate)
} |
Select-Object Name,
@{ Name="Size (MB)"; Expression = {[math]::Round($_.Length / 1MB, 2)} },
LastWriteTime |
Format-Table -AutoSize