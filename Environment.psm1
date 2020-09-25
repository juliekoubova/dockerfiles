Function Set-EnvironmentVariable {
  Param (
    [String] $Name,
    [String] $Value
  )
  [System.Environment]::SetEnvironmentVariable($Name, $Value, 'Process')
  [System.Environment]::SetEnvironmentVariable($Name, $Value, 'User')
}

Function Add-PathVariable {
  Param (
    [String] $Value,
    [String] $Name = 'PATH'
  )
  $OldValue = [System.Environment]::GetEnvironmentVariable($Name, 'User')
  $Paths = $OldValue.Split(@(';'), 'RemoveEmptyEntries')
  $Paths = @($Value) + $Paths

  [System.Environment]::SetEnvironmentVariable(
    $Name,
    [String]::Join(';', $Paths),
    'User'
  )
}

Function Install-Msi {
  Param (
    [String] $Path,
    [String[]] $AdditionalArgs = @()
  )
  $LogPath = "${Path}.log"
  $ArgumentList = @('/package', $Path, '/Le', $LogPath, '/norestart', '/quiet')
  $ArgumentList += $AdditionalArgs
  Try {
    Test-LastExitCode `
      -Path "${Env:SystemRoot}\System32\msiexec.exe" `
      -ArgumentList $ArgumentList `
      -SuccessExitCodes 0, 3010
  }
  Catch {
    Throw "Error installing ${Path}:`n$(Get-Content $LogPath -Raw -ea SilentlyContinue)"
  }
  Finally {
    Remove-Item $LogPath -Force -ea SilentlyContinue
  }
}

Function Install-Uri {
  Param (
    [Uri] $Uri,
    [String] $OutFile,
    [ScriptBlock] $InstallScript
  )
  Try {
    Invoke-WebRequest -Uri $Uri -OutFile $OutFile -Verbose
    & $InstallScript
  }
  Finally {
    Remove-Item $OutFile -Verbose -Force -ea SilentlyContinue
  }
}

Function Test-LastExitCode {
  Param (
    [String] $Path,
    [String[]] $ArgumentList = @(),
    [Int32[]] $SuccessExitCodes = @(0)
  )
  $StartParams = @{
    FilePath    = $Path
    NoNewWindow = $true
    PassThru    = $true
    Verbose     = $true
    Wait        = $true
  }
  If ($ArgumentList.Length) {
    $StartParams['ArgumentList'] = $ArgumentList
  }
  Write-Information "${Path} $($ArgumentList -join ' ')"
  $Process = Start-Process @StartParams
  If ($SuccessExitCodes -notcontains $Process.ExitCode) {
    Throw "Exit code: $($Process.ExitCode)"
  }
}