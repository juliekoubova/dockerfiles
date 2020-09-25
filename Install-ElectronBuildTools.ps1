Using Module .\Environment.psm1

Test-LastExitCode npm @(
  'install'
  '--global'
  '@electron/build-tools'
)

$ElectronBuildTools = "${Env:USERPROFILE}\.electron_build_tools"

New-Item `
  -Path "${ElectronBuildTools}\third_party" `
  -ItemType Directory `
  -Force

Test-LastExitCode e @('update-goma')