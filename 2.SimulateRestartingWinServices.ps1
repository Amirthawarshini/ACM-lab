Get-Service | Where-Object{ $_.Status -eq 'Stopped' } | 
    ForEach-Object { 
        Write-Host "Simulating restart of service: $($_.Name) with status: $($_.Status)" 
        Restart-Service -Name $_.Name -WhatIf 
    }