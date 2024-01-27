$env:user_name = "param0unt"

$line = "==============="

for ($i = 0; $i -lt $env:user_name.Length; $i++) {
    $line = $line + "="
}

Write-Host 
Write-Host $line
Write-Host "|  Welcome $env:user_name!  |"
Write-Host $line
Write-Host

function prompt {
    [array] $git_status = git status
    $branch_name = ""
    if ($git_status.Length -gt 0) {
        $match = $git_status[0] | Select-String -Pattern '^On branch (.*)$'
        $branch_name = $match.Matches.Groups[1].Value
    }
    $current_directory = Get-Location
    Write-Host -NoNewline "$env:user_name" -ForegroundColor DarkCyan
    if ($branch_name -cne "") {
        Write-Host -NoNewline " [$current_directory] <$branch_name> :" -ForegroundColor Green
    }
    else {
        Write-Host -NoNewline " [$current_directory] :" -ForegroundColor DarkBlue
    }

    return " "
}