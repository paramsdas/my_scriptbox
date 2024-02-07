Import-Module PSScheduledJob

$trigger = New-JobTrigger -AtLogon -RandomDelay 00:00:30 -User param
Register-ScheduledJob -Trigger $trigger -Name UpdateScoop -ScriptBlock {
  Invoke-Expression "scoop update"
  Invoke-Expression "scoop update -a"
}