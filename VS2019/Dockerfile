# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

# Download the Build Tools bootstrapper.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe

# Download Windows 10 SDK 10.0.19041.0 for Windows 10, version 2004
ADD https://go.microsoft.com/fwlink/p/?linkid=2120843 C:\TEMP\winsdksetup.exe

# Install Build Tools
RUN C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --installPath "%ProgramFiles(x86)%/Microsoft Visual Studio/2019/Community" `
    --lang en-US `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --add Microsoft.VisualStudio.Component.VC.140 `
    --add Microsoft.VisualStudio.Component.VC.ATLMFC `
    --add Microsoft.VisualStudio.Component.VC.CMake.Project `
    --add Microsoft.VisualStudio.Component.VC.MFC.ARM64 `
    --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
    --add Microsoft.VisualStudio.Component.VC.Tools.ARM64 `
 || IF "%ERRORLEVEL%"=="3010" EXIT 0

RUN C:\TEMP\winsdksetup.exe /features + /quiet /norestart