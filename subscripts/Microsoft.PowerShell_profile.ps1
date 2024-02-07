$line = "==============="

$user_name = [System.Environment]::GetEnvironmentVariable('user_name')
$user_working_directory = [System.Environment]::GetEnvironmentVariable('user_working_directory')
$user_enable_powershell_prediction = [System.Environment]::GetEnvironmentVariable('user_enable_powershell_prediction')

if (! $user_enable_powershell_prediction) {
  Set-PSReadLineOption -PredictionSource None
}

if ($user_name.Length -eq 0) {
  $user_name = "User"
}

for ($i = 0; $i -lt $user_name.Length; $i++) {
  $line = $line + "="
}

Write-Host 
Write-Host $line
Write-Host -NoNewline "|  Welcome "
Write-Host -NoNewline "$user_name" -ForegroundColor DarkCyan
Write-Host "!  |"
Write-Host $line
Write-Host

if ($user_working_directory.Length -ne 0) {
  Set-Location $user_working_directory
}

function prompt {
  [array] $git_status = git status
  $branch_name = ""
  if ($git_status.Length -gt 0) {
    $match = $git_status[0] | Select-String -Pattern '^On branch (.*)$'
    $branch_name = $match.Matches.Groups[1].Value
  }
  $current_directory = Get-Location
  Write-Host -NoNewline "$user_name" -ForegroundColor DarkCyan
  if ($branch_name -cne "") {
    Write-Host -NoNewline " [$current_directory] <$branch_name> :" -ForegroundColor Green
  }
  else {
    Write-Host -NoNewline " [$current_directory] :" -ForegroundColor DarkBlue
  }

  return " "
}