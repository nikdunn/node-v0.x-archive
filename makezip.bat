mkdir node-v0.10.25 
mkdir node-v0.10.25\node_modules
mkdir node-v0.10.25\node_modules\npm

copy zip.js node-v0.10.25
copy Release\node.exe node-v0.10.25
copy tools\msvs\nodevars.bat node-v0.10.25
copy tools\msvs\npm\npmrc node-v0.10.25\node_modules\npm.rc
xcopy deps\npm node-v0.10.25\node_modules\npm /s /e /y
copy deps\npm\bin\npm node-v0.10.25\npm.sh
copy deps\npm\bin\npm.cmd node-v0.10.25

rem Ensure this Node.js and npm are first in the PATH
set PATH=%~dp0\node-v0.10.25;%PATH%

call npm install -g archiver 
call npm install -g rimraf 
call npm install -g node-inspector
call npm install -g mocha
pushd node-v0.10.25\node_modules
call node ..\zip.js node-inspector.zip node-inspector
popd
call rimraf node-v0.10.25\node_modules\node-inspector

call node node-v0.10.25\zip.js ..\node-v0.10.25.windows.binaries.zip node-v0.10.25 
