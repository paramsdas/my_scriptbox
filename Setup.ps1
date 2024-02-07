$line = "== == == == == == == == == == == == == == == == == == == == == == == == == =="
################################################################################
Write-Host $line
Write-Host 
Write-Host "Starting script setup..." -ForegroundColor Green
Write-Host
################################  Scoop  #######################################
Write-Host $line
.\subscripts\scoop.ps1
###############################  Profile  ######################################
Write-Host $line
.\subscripts\setup_profile.ps1
################################################################################
Write-Host $line
Write-Host
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host
Write-Host $line
################################################################################