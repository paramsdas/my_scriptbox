$moduleManifest = $PSScriptRoot + [System.IO.Path]::DirectorySeparatorChar + "ScriptboxUtils.psd1"
Test-ModuleManifest $moduleManifest


$functions = @(Get-ChildItem $PSScriptRoot\Public\ -Filter *.ps1 -Recurse) 

$functions | ForEach-Object {
  . $_.FullName
  Export-ModuleMember -Function $_.BaseName
}

try {
  $updateManifestParams = @{}
  $updateManifestParams.Add('Path', $moduleManifest)
  $updateManifestParams.Add('ErrorAction', 'Stop')
  $updateManifestParams.Add('FunctionsToExport', $functions.BaseName)
  Update-ModuleManifest @updateManifestParams
}
catch {
  $_ | Write-Error
}

# create script scoped variable so default config only has to be read once when the module is being imported
$defaultConfig = $(yq '... comments=""' $PSScriptRoot\defaultConfig.yml)