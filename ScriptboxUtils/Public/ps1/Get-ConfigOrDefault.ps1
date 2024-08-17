Function Get-ConfigOrDefault {
  <#
.SYNOPSIS
    Get the config value from the config file or the default config value.

.DESCRIPTION
    Add-ScoopApp installs an app using scoop if not already installed. 
    This function requires the 'yq' command line tool.

.PARAMETER $Config
    config file contents as string

.PARAMETER $YqPath
    Path to the yq config element

.EXAMPLE
    Get-ConfigOrDefault -Config "<...config.yaml as string>" -YqPath ".retainYq"

.NOTES
    Author:  Paramvir Das
#>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    $Config,
    [Parameter(Mandatory)]
    [string]$YqPath
  )

  $isYqInstalled = $(Test-App -CLICommand 'yq')

  if (!$isYqInstalled) {
    Write-Information "'yq' required but not found, exiting"
    return "null"
  }

  $value = $($Config | yq $YqPath)

  if ($value -eq "null") {
    $value = $script:defaultConfig | yq $YqPath
  }
  return $value
  
}