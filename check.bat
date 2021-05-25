@echo off
echo "update started"
set current_path=%~dp0
echo %current_path%
rd /s /q %current_path%previous_version
mkdir %current_path%previous_version
ROBOCOPY %current_path% %current_path%previous_version * /MOV /XF abc.txt check.bat _new_update
echo "backed up"
ROBOCOPY %current_path%_new_update %current_path%  * /e /MOV /r:0 /w:0
rd /s /q %current_path%_new_update
echo "update finished"
pause