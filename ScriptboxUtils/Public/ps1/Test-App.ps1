function Test-App {
  <#
.SYNOPSIS
    Test if an app is usable as a CLI tool.

.DESCRIPTION
    Test-App tries to run the specified command without any parameters and checks the ouput.
    Depending on the output it returns a boolean which tells if an app is installed and usable as a CLI tool.

.PARAMETER $CLICommand
    The command used to call the app's CLI.

.EXAMPLE
    Test-App git

.INPUTS
    String

.OUTPUTS
    Boolean

.NOTES
    Author:  Paramvir Das
#>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory, HelpMessage = 'The command used to call the app on the CLI')]
    [string]$CLICommand
  )

  $(Invoke-Expression -Command $CLICommand -ErrorVariable errorOutput) 6>$null
  $errorMsg = $errorOutput -join ','
  if ($errorMsg -eq '') {
    Write-Verbose "App '$CLICommand' found"
  }
  else {
    Write-Verbose "App '$CLICommand' not found: $errorMsg"
  }
  $appFound = $errorMsg -notmatch '.*not recognized as a name of a cmdlet, function, script file, or executable program.*'

  return $appFound
}