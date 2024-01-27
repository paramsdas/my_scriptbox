$line = "== == == == == == == == == =="
Write-Host $line
Write-Host 
Write-Host "Starting script setup..." -ForegroundColor Yellow
Write-Host
Write-Host $line
.\subscripts\setup_profile.ps1
Write-Host $line
.\subscripts\scoop.ps1
Write-Host $line
Write-Host
Write-Host "All scripts have been updated!" -ForegroundColor Green
Write-Host
Write-Host $line