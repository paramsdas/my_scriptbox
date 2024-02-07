Function Add-ScoopBucket {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [string]$BucketName
  )
  Write-Host "- adding bucket '$BucketName'"
  scoop bucket add $BucketName *> $PSScriptRoot\scoop_bucket.txt
  $bucket_status = Get-Content $PSScriptRoot\scoop_bucket.txt | Select-String -Pattern "WARN (.*)" -Quiet 
  if ($bucket_status) {
    Write-Host "  bucket '$BucketName' already exists, skipping..."
  }
  else {
    Write-Host "  bucket '$BucketName' added!"
  }
  Remove-Item $PSScriptRoot\scoop_bucket.txt -Force
}