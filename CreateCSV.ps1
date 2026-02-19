Get-Service -ErrorAction SilentlyContinue |
    Where-Object { $_.Status -eq 'Running' } |
    Select-Object Name, DisplayName, Status |
    Export-Csv -Path "C:\GitHub\ACM-lab\RunningServicesReport.csv" -NoTypeInformation