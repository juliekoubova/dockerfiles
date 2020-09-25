Using Module .\Environment.psm1

$SourceUri = 'https://github.com/git-for-windows/git/releases/download/v2.28.0.windows.1/Git-2.28.0-64-bit.exe'
$SourceExe = 'Git-2.28.0-64-bit.exe'
$LogPath = "${SourceExe}.log"

Install-Uri $SourceUri $SourceExe {
  Test-LastExitCode $SourceExe @(
    '/AllUsers'
    '/CURLOption=WinSSL'
    '/EditorOption=VIM'
    "/Log=`"${LogPath}`""
    '/NoIcons'
    '/NoRestart'
    '/PathOption=Cmd'
    '/TortoiseOption=false'
    '/UseCredentialManager=Core'
    '/VerySilent'
  )
}

# If ($Env:GIT_CACHE_PATH) {
#   New-Item $Env:GIT_CACHE_PATH -Force -ItemType Directory
# }

Test-LastExitCode "${Env:ProgramFiles}\Git\cmd\git.exe" @(
  'config'
  '--global'
  'branch.autocrlf'
  'false'
)

Test-LastExitCode "${Env:ProgramFiles}\Git\cmd\git.exe" @(
  'config'
  '--global'
  'branch.autosetuprebase'
  'always'
)

Test-LastExitCode "${Env:ProgramFiles}\Git\cmd\git.exe" @(
  'config'
  '--global'
  'core.filemode'
  'false'
)