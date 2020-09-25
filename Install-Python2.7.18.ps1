Using Module .\Environment.psm1

$SourceUri = 'https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi '
$SourceMsi = 'python-2.7.18.amd64.msi'

Install-Uri $SourceUri $SourceMsi {
  Install-Msi $SourceMsi @('ALLUSERS=1', 'ADDLOCAL=ALL')
}

Add-PathVariable 'C:\Python27\Scripts'
Add-PathVariable 'C:\Python27'
Set-EnvironmentVariable 'PYTHONIOENCODING' 'UTF-8'

Test-LastExitCode 'C:\Python27\Scripts\pip2.exe' @(
  'install'
  'pywin32'
)