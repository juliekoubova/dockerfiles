choco install -y git 
call C:\ProgramData\chocolatey\bin\RefreshEnv.cmd

SET GIT_CACHE_PATH=C:\gitcache
SETX GIT_CACHE_PATH "%GIT_CACHE_PATH%"
MKDIR "%GIT_CACHE_PATH%"

git config --global core.filemode false
git config --global core.autocrlf false
git config --global branch.autosetuprebase always