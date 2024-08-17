function Sync-ScoopConfig {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    $Config
  ) 

  Write-Information "applying scoop config"
  $($scoop_from_config = Get-ConfigOrDefault -Config $Config -YqPath ".scoop.installFromConfig") 6>&1
  
  if ($scoop_from_config -ne "true") {
    Write-Information "Skipping scoop installation"
    return; 
  }

  # install scoop
  $isScoopInstalled = $(Test-App -CLICommand 'scoop')
  if (!$isScoopInstalled) {
    Install-Scoop
  }

  # add buckets
  $($scoop_buckets_list = Get-ConfigOrDefault -Config $Config -YqPath ".scoop.bucketList") 6>&1
  $scoop_buckets = $scoop_buckets_list.Split([System.Environment]::NewLine)
  foreach ($bucket in $scoop_buckets) {
    $bucket_name = $bucket | Select-String -Pattern "^- (.*)" | ForEach-Object { $_.Matches.Groups[1].Value }
    Add-ScoopBucket -BucketName $bucket_name
  }
  
  #add apps
  $($scoop_app_list = Get-ConfigOrDefault -Config $Config -YqPath ".scoop.appList") 6>&1
  $scoop_apps = $scoop_app_list.Split([System.Environment]::NewLine)
  foreach ($app in $scoop_apps) {
    $app_name = $app | Select-String -Pattern "^- (.*)" | ForEach-Object { $_.Matches.Groups[1].Value }
    Add-ScoopApp -AppName $app_name
  }

  Write-Information "Scoop config applied!"
}