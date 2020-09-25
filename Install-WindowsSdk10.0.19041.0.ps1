Using Module .\Environment.psm1

$SourceUri = 'https://go.microsoft.com/fwlink/p/?linkid=2120843'
$SourceExe = 'winsdksetup.exe'

InstallFrom-Uri $SourceUri $SourceExe {
   & $SourceExe /features + /quiet /norestart
}