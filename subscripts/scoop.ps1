# Installing Scoop
Write-Host ""
Write-Host "Installing scoop..."
scoop --version *> .\scoop_version.txt
$version_txt_content = Get-Content -Path .\scoop_version.txt
$strings = $version_txt_content.Split([System.Environment]::NewLine)
if ($strings[0] = "Current Scoop version:") {
    Write-Host "Scoop already installed."
    Write-Host $strings[0] $strings[1]
}
else {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

Remove-Item .\scoop_version.txt

Invoke-Expression "$PSScriptRoot\scoop_apps\yq.ps1"
Invoke-Expression "$PSScriptRoot\scoop_apps\git.ps1"

Write-Host 
Write-Host "Scoop has been set up. Have fun installing apps!"
Write-Host