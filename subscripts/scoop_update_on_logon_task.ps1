$user = "param"
$actions = (New-ScheduledTaskAction -Execute 'C:\Users\param\OneDrive\Documents\scoop_update.bat'), (New-ScheduledTaskAction -Execute 'C:\Users\param\scoop\apps\powertoys\current\PowerToys.exe')
$trigger = New-ScheduledTaskTrigger -AtLogOn -RandomDelay 00:01:00 -User $user
$taskPath = "\CustomTasks\"
$taskName = "UpdateScoopAndStartPowerToys"

$task = New-ScheduledTask -Action $actions -Trigger $trigger

Register-ScheduledTask -TaskName $taskName -TaskPath $taskPath -InputObject $task -User $user