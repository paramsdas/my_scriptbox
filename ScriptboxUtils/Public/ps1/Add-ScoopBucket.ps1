Function Add-ScoopBucket {
  <#
.SYNOPSIS
    Add a bucket using scoop.

.DESCRIPTION
    Add-ScoopBucket adds a bucket to scoop if not already added.

.PARAMETER $BucketName
    The name of the bucket to add to scoop.

.EXAMPLE
    Add-ScoopBucket -BucketName "main"

.NOTES
    Author:  Paramvir Das
#>
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [string]$BucketName
  )
  Write-Verbose "adding bucket '$BucketName'"
  $bucketOutput = (scoop bucket add $BucketName *>&1)
  if ($bucketOutput -notmatch '^WARN.*$') {
    Write-Information "bucket '$BucketName' added!"
  }
  else {
    Write-Verbose "bucket '$BucketName' already exists"
  }
}