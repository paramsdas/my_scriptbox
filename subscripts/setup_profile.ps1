Write-Host
Write-Host "Setting up profile..."

if (Test-Path -Path $PROFILE.CurrentUserCurrentHost) {
    Remove-Item -Path $PROFILE.CurrentUserCurrentHost -Force
}

$user_name = Get-Content $PSScriptRoot\..\config\config.yaml | yq '.user.name'
$user_working_directory = Get-Content $PSScriptRoot\..\config\config.yaml | yq '.user.working_directory'
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

Copy-Item .\subscripts\Microsoft.PowerShell_profile.ps1 $PROFILE.CurrentUserCurrentHost
Write-Host "Profile set up!"
Write-Host