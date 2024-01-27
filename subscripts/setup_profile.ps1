Write-Host
Write-Host "Setting up profile..."

if (Test-Path -Path $PROFILE.CurrentUserCurrentHost) {
    Remove-Item -Path $PROFILE.CurrentUserCurrentHost -Force
}

Copy-Item .\subscripts\Microsoft.PowerShell_profile.ps1 $PROFILE.CurrentUserCurrentHost
Write-Host "Profile set up!"
Write-Host