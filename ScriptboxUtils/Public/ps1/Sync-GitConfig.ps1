Function Sync-GitConfig {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    $Config
  )

  Write-Information "Setting up git profile"
  $isGitInstalled = Test-App -CLICommand 'git'

  if (!$isGitInstalled) {
    Write-Information "git not installed, skipping git configs"
    return
  }

  $($git_user_name = Get-ConfigOrDefault -Config $Config -YqPath ".git.user.name") 6>&1
  $($git_user_email = Get-ConfigOrDefault -Config $Config -YqPath ".git.user.email") 6>&1

  if ($git_user_name.Length -ne 0) {
    git config --global user.name "$git_user_name"
  }
  else {
    Write-Verbose "No git username specified in config"
  }

  if ($git_user_email.Length -ne 0) {
    git config --global user.email "$git_user_email"
  }
  else {
    Write-Verbose "No git username specified in config"
  }

  Write-Information "Git profile set up!"
}