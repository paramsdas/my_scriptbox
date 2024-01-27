$git_status = git status
if ($git_status.Length -gt 0) {
    $match = $git_status[0] | Select-String -Pattern '^On branch (.*)$'
    $branch_name = $match.Matches.Groups[1].Value
}

Write-Host $branch_name