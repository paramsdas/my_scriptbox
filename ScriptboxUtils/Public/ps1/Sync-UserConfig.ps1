Function Sync-UserConfig {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    $Config
  )

  Write-Information "Setting user profile"

  if (Test-Path -Path $PROFILE.CurrentUserCurrentHost) {
    Remove-Item -Path $PROFILE.CurrentUserCurrentHost -Force
  }

  # fetch user configs
  $($user_name = Get-ConfigOrDefault -Config $Config -YqPath ".user.name") 6>&1
  $($user_working_directory = Get-ConfigOrDefault -Config $Config -YqPath ".user.workingDirectory") 6>&1
  $($user_enable_powershell_prediction = Get-ConfigOrDefault -Config $Config -YqPath ".user.enablePowerShellPrediction") 6>&1

  if ($user_name.Length -ne 0) {
    [System.Environment]::SetEnvironmentVariable('user_name', "$user_name", 'User')
  }

  if ($user_working_directory.Length -ne 0) {
    [System.Environment]::SetEnvironmentVariable('user_working_directory', "$user_working_directory", 'User')
  }

  if ($user_enable_powershell_prediction -eq "false") {
    [System.Environment]::SetEnvironmentVariable('user_enable_powershell_prediction', "$user_enable_powershell_prediction", 'User')
  }

  Copy-Item $PSScriptRoot\..\..\..\config\Microsoft.PowerShell_profile.ps1 $PROFILE.CurrentUserCurrentHost
  $personalConfig = Get-Content $PSScriptRoot\..\..\..\config\PersonalProfileConfig.ps1
  Add-Content -Path $PROFILE.CurrentUserCurrentHost -Value $personalConfig
  Write-Information "Profile set up! Please open a new terminal to see the changes ^_^!"
}