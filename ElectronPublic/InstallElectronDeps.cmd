REM Install nodejs python git and yarn needed dependencies
choco install -y nodejs python2 yarn 
call C:\ProgramData\chocolatey\bin\RefreshEnv.cmd
SET PATH=C:\Python27\;C:\Python27\Scripts;%PATH%

pip install pywin32
call C:\ProgramData\chocolatey\bin\RefreshEnv.cmd
pip2 install pywin32
