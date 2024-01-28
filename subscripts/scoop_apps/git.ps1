####################   git   ####################
Write-Host
Write-Host "Installing/Updating git..."
scoop list git *> $PSScriptRoot\git.txt
$version_txt_content = Get-Content -Path $PSScriptRoot\git.txt
$strings = $version_txt_content.Split([System.Environment]::NewLine)
if ($strings.Count -le 1) {
    scoop install git
}
else {
    scoop update git
}

$git_user_name = Get-Content $PSScriptRoot\..\..\config\config_stripped.yaml | yq '.git.user.name'
$git_user_email = Get-Content $PSScriptRoot\..\..\config\config_stripped.yaml | yq '.git.user.email'
if ($git_user_name.Length -ne 0) {
    git config --global user.name "$git_user_name"
}
else {
    Write-Verbose "No git username specified (.git.user.name) in ..\..\config\config_stripped.yaml"
}

if ($git_user_email.Length -ne 0) {
    git config --global user.email "$git_user_email"
}
else {
    Write-Verbose "No git username specified (.git.user.name) in ..\..\config\config_stripped.yaml"
}

Remove-Item $PSScriptRoot\git.txt

#################################################