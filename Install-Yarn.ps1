Using Module .\Environment.psm1

$SourceUri = 'https://classic.yarnpkg.com/latest.msi'
$SourceMsi = 'yarn.msi'

Install-Uri $SourceUri $SourceMsi {
  Install-Msi $SourceMsi @('ALLUSERS=1')
}
