Using Module .\Environment.psm1

$SourceUri = 'https://aka.ms/vs/16/release/vs_buildtools.exe'
$SourceExe = 'vs_buildtools.exe'

InstallFrom-Uri $SourceUri $SourceExe {
  & $SourceExe `
    --installPath "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Community" `
    --lang en-US `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --add Microsoft.VisualStudio.Component.VC.140 `
    --add Microsoft.VisualStudio.Component.VC.ATLMFC `
    --add Microsoft.VisualStudio.Component.VC.CMake.Project `
    --add Microsoft.VisualStudio.Component.VC.MFC.ARM64 `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.VC.Tools.ARM64 `
    --quiet --wait --norestart --nocache

  If ((0, 3010) -notcontains $LastExitCode) {
    $Logs = Get-ChildItem $Env:TEMP -Filter dd_setup_*_errors.log `
  | Where-Object Length -gt 0 `
  | Get-Content
    If ($Logs) {
      Throw $Logs
    }
    Else {
      Throw ""
    }
  }

  Remove-Item -Force -Recurse -Path @(
    $Bootstrap
    "${Env:ProgramData}\Package Cache"
    "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer"
    "${Env:TEMP}\*"
  )
}