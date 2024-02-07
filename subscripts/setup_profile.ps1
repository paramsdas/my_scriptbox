Write-Host
Write-Host "Setting up profile..."

if (Test-Path -Path $PROFILE.CurrentUserCurrentHost) {
  Remove-Item -Path $PROFILE.CurrentUserCurrentHost -Force
}

$config = Get-Content $PSScriptRoot\..\config\config_stripped.yaml

$user_name = $config | yq '.user.name'
$user_working_directory = $config | yq '.user.workingDirectory'
$user_enable_powershell_prediction = $config | yq '.user.enablePowerShellPrediction'

if ($user_name.Length -ne 0) {
  [System.Environment]::SetEnvironmentVariable('user_name', "$user_name", 'User')
}
else {
  [System.Environment]::SetEnvironmentVariable('user_name', "", 'User')
}

if ($user_working_directory.Length -ne 0) {
  [System.Environment]::SetEnvironmentVariable('user_working_directory', "$user_working_directory", 'User')
}
else {
  [System.Environment]::SetEnvironmentVariable('user_working_directory', "", 'User')
}

if ($user_enable_powershell_prediction -ne 0) {
  [System.Environment]::SetEnvironmentVariable('user_enable_powershell_prediction', "$user_enable_powershell_prediction", 'User')
}
else {
  [System.Environment]::SetEnvironmentVariable('user_enable_powershell_prediction', "", 'User')
}

Copy-Item $PSScriptRoot\Microsoft.PowerShell_profile.ps1 $PROFILE.CurrentUserCurrentHost
Write-Host "Profile set up!"
Write-Host