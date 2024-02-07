Function Add-ScoopApp {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [string]$AppName
  )
  Write-Host "- installing/updating $AppName"
  scoop list $AppName *> $PSScriptRoot\$AppName.txt
  $app_txt_content = Get-Content -Path $PSScriptRoot\$AppName.txt
  $strings = $app_txt_content.Split([System.Environment]::NewLine)
  if ($strings.Count -le 1) {
    scoop install $AppName
  }
  else {
    scoop update $AppName
  }
  Remove-Item $PSScriptRoot\$AppName.txt
}