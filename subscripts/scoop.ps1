# Create config without comments (config_stripped.yaml)
yq '... comments=""' $PSScriptRoot\..\config\config.yaml | Set-Content -Path $PSScriptRoot\..\config\config_stripped.yaml -Force

# Installing Scoop
Write-Host
Write-Host "=== Installing scoop, yq and git ==="
Write-Host
Write-Host "- installing/updating scoop"
scoop --version *> $PSScriptRoot\scoop_version.txt
$version_txt_content = Get-Content -Path $PSScriptRoot\scoop_version.txt
$strings = $version_txt_content.Split([System.Environment]::NewLine)
if ($strings[0] = "Current Scoop version:") {
    Write-Host "Scoop already installed."
    Write-Host $strings[0] $strings[1]
}
else {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}
Remove-Item $PSScriptRoot\scoop_version.txt
scoop update
# Load Scoop functions into current scope
. $PSScriptRoot\scoop_apps\Add-ScoopBucket.ps1
. $PSScriptRoot\scoop_apps\Add-ScoopApp.ps1

# Install yq and git
Add-ScoopApp -AppName yq
Add-ScoopApp -AppName git

# Load other apps and buckets from the config file using scoop
$scoop_from_config = Get-Content $PSScriptRoot\..\config\config_stripped.yaml | yq '.scoop.install_from_config'
if ($scoop_from_config -eq "true") {
    Write-Host
    Write-Host "=== Installing scoop apps/buckets from config ==="
    Write-Host
    Invoke-Expression $PSScriptRoot\scoop_apps\install_config_apps.ps1
}
else {
    Write-Host
}

Write-Host "=== Scoop has been set up. Have fun installing apps! ==="
Write-Host