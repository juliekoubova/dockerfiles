Using Module .\Environment.psm1

$SourceUri = "https://nodejs.org/dist/v${Env:NODE_VERSION}/node-v${Env:NODE_VERSION}-x64.msi"
$SourceMsi = "node-${Env:NODE_VERSION}-x64.msi"

Install-Uri $SourceUri $SourceMsi {
  Install-Msi $SourceMsi @('ADDLOCAL=ALL', 'ALLUSERS=1', 'REMOVE=NodeEtwSupport')
}