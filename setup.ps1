# Installing Scoop
#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
#irm get.scoop.sh | iex

# Adding custom profile ('personal_profile.ps1' in the same folder)
$content = Get-Content -Path .\personal_profile.ps1
New-Item `
    -ItemType File `
    -Value $content `
    -Path $Profile.CurrentUserCurrentHost -Force
