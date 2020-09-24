REM Install chocolatey to further install dependencies
SET chocolateyUseWindowsCompression=true
SETX chocolateyUseWindowsCompression true

"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" ^
    -NoProfile -InputFormat None -ExecutionPolicy Bypass ^
    -Command "Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
SETX PATH "%PATH%"
