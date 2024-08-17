Function Add-ScoopApp {
  <#
.SYNOPSIS
    Add an app using scoop.

.DESCRIPTION
    Add-ScoopApp installs an app using scoop if not already installed.

.PARAMETER $AppName
    The name of the app to be installed.

.EXAMPLE
    Add-ScoopApp -AppName "git"

.NOTES
    Author:  Paramvir Das
#>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [string]$AppName
  )
  
  Write-Output "# Installing $AppName"
  $appStatus = scoop list $AppName *>&1
  if ($appStatus.Count -le 1) {
    scoop install $AppName
  }
  else {
    Write-Output "App already installed using scoop"
  }
}