function Install-Scoop {
  <#
.SYNOPSIS
    Install scoop.

.DESCRIPTION
    Installs scoop as it is decribed at https://scoop.sh.

.EXAMPLE
    Install-Scoop

.NOTES
    Author:  Paramvir Das
#>

  [CmdletBinding()]
  Param()
  
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
  Invoke-RestMethod get.scoop.sh | Invoke-Expression
}