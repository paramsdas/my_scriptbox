# Installing Scoop
Write-Host ""
Write-Host "Installing scoop..."
scoop --version *> .\scoop_version.txt
$version_txt_content = Get-Content -Path .\scoop_version.txt
$strings = $version_txt_content.Split([System.Environment]::NewLine)
if ($strings[0] = "Current Scoop version:") {
    Write-Host "Scoop already installed."
    Write-Host $strings[0] $strings[1]
} else {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

# Adding custom profile ('personal_profile.ps1' in the same folder)
Write-Host ""
Write-Host "Adding custom profile 'personal_profile.ps1'..."
$content = Get-Content -Path .\personal_profile.ps1
# creates new file
New-Item `
-ItemType File `
-Path $Profile.CurrentUserCurrentHost -Force
# adds content to the profile file line by line
for ($i=0; $i -lt $content.length; $i++){ 
    Add-Content $Profile.CurrentUserCurrentHost $content[$i]
    }
Write-Host $fileContent


Write-Host ""
Write-Host "Setup script run successfully. Restart powershell to see the effects!"
Write-Host ""