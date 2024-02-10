# Add buckets
Write-Host "== Adding buckets from config =="
$scoop_bucket_list = Get-Content $PSScriptRoot\..\..\config\config_stripped.yaml | yq '.scoop.bucketList'
$scoop_buckets = $scoop_bucket_list.Split([System.Environment]::NewLine)
foreach ($bucket in $scoop_buckets) {
  $bucket_name = $bucket | Select-String -Pattern "^- (.*)" | ForEach-Object { $_.Matches.Groups[1].Value }
  Add-ScoopBucket -BucketName $bucket_name
}
Write-Host "== Buckets added successfully! =="
Write-Host

#Add apps
Write-Host "== Adding apps from config =="
$scoop_app_list = Get-Content $PSScriptRoot\..\..\config\config_stripped.yaml | yq '.scoop.appList'
$scoop_apps = $scoop_app_list.Split([System.Environment]::NewLine)
foreach ($app in $scoop_apps) {
  $app_name = $app | Select-String -Pattern "^- (.*)" | ForEach-Object { $_.Matches.Groups[1].Value }
  Add-ScoopApp -AppName $app_name
}
Write-Host "== Apps added successfully! =="
Write-Host