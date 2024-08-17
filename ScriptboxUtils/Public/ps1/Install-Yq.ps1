function Install-Yq () {
  <#
.SYNOPSIS
    Install yq.

.DESCRIPTION
    Install-Yq checks whether yq is already installed or not. If not, it checks whether scoop is installed or not. 
    If missing, it is installed by scoop if available, otherwise using winget.
    The function returns a string specifying the source from where yq was installed. Currently possible sources are:
      - none (if yq was already found)
      - winget
      - scoop

.EXAMPLE
    Install-Yq

.OUTPUTS
    String

.NOTES
    Author:  Paramvir Das
#>
  
  [CmdletBinding()]
  param()

  $isYqInstalled = $(Test-App -CLICommand 'yq')
  $isScoopInstalled = $(Test-App -CLICommand 'scoop')

  Write-Information "installing yq..."

  if ($isYqInstalled) {
    Write-Information "yq is already installed, proceeding further"
    return "none"
  }

  if ($isScoopInstalled) {
    Write-Verbose "yq is already installed, proceeding further"
    Invoke-Expression "scoop install yq"
    return "scoop"
  }
  
  Write-Verbose "downloading yq using winget (will be replaced later with a scoop installation if scoop.installFromConfig is set to true)"
  Invoke-Expression "winget install --id MikeFarah.yq"
  Write-Verbose "refreshing powershell session"
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
  
  $isYqInstalled = $(Test-App -CLICommand 'yq')
  if ($isYqInstalled) {
    Write-Verbose "yq installed and available"
  }
  else {
    Write-Error "Unexpected error: yq not found after installing and refreshing powershell session!"
  }

  return "winget"
}