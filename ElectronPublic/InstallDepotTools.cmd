REM Setup Depot Tools
SET DEPOT_TOOLS_DIR=C:\depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git %DEPOT_TOOLS_DIR%
SET PATH=%PATH%;%DEPOT_TOOLS_DIR%

SETX DEPOT_TOOLS_DIR "%DEPOT_TOOLS_DIR%"
SETX PATH "%PATH%"

CD %DEPOT_TOOLS_DIR%
.\update_depot_tools