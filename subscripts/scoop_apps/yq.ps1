####################   yq   ####################
Write-Host
Write-Host "Installing/Updating yq..."
scoop list yq *> .\yq.txt
$version_txt_content = Get-Content -Path .\yq.txt
$strings = $version_txt_content.Split([System.Environment]::NewLine)
if ($strings.Count -le 1) {
    scoop install yq
}
else {
    scoop update yq
}

Remove-Item .\yq.txt