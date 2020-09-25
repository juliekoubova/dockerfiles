docker run ^
    --name electron ^
    --interactive ^
    --tty ^
    --volume d:\src\electron:c:\src ^
    --volume d:\gitcache:c:\gitcache ^
    electron ^
    powershell