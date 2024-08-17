Import-Module $PSScriptRoot\ScriptboxUtils

# install yq if not already present
$($yq_source = Install-Yq) 6>&1
# load config
$config = $(yq '... comments=""' $PSScriptRoot\config\config.yml)

#apply configs
Write-Host ""
Sync-ScoopConfig -Config $config 6>&1
Write-Host ""
Sync-UserConfig -Config $config 6>&1
Write-Host ""
Sync-GitConfig -Config $config 6>&1
Write-Host ""

# remove yq, if it was installed using winget
if ($yq_source -eq "winget") {
  Write-Host "Remove winget installation of yq"
  $(winget uninstall --id MikeFarah.yq)
}