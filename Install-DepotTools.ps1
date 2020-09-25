Using Module .\Environment.psm1

Test-LastExitCode git @(
  'clone'
  'https://chromium.googlesource.com/chromium/tools/depot_tools.git'
  $Env:DEPOT_TOOLS_DIR
)

Test-LastExitCode "${Env:DEPOT_TOOLS_DIR}\update_depot_tools.bat"

Add-PathVariable $Env:DEPOT_TOOLS_DIR
