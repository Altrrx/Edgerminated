@echo off
cd /d "%ProgramFiles(x86)%"
goto :init

:init
title EDGERMINATER *EDGE & IE UNINSTALLER*
call :logo

echo -- Help
echo If you can't uninstall Edge or Internet Explorer with this program, use the "> ltk msedgewebview2" option to kill msedgewebview2, preventing errors while deleting the Microsoft Edge folder. [use a TrustedInstaller hack too]
echo RUN THIS AS A ADMINISTRATOR!!

echo]
echo]
echo > ltk msedgewebview2 [1]
echo > Uninstall MS Edge [2]
echo > Uninstall Internet Explorer [3]
echo > Uninstall Both [4]
echo > Exit. [5]

set selection=
set /P selection=Choose an option: 

IF /I '%selection%' == '1' GOTO :ltk
IF /I '%selection%' == '2' GOTO :unins_edge
IF /I '%selection%' == '3' GOTO :unins_ie
IF /I '%selection%' == '4' GOTO :unins_both
IF /I '%selection%' == '5' GOTO :exit

echo Invalid option, try again.
goto :init

:secret
cls
echo Woah, you actually found me!
pause
goto :init

:ltk
taskkill /F /IM msedgewebview2.exe
cls
call :logo
echo msedgewebview2.exe has been terminated.
pause
goto :init

:unins_edge
taskkill /F /IM msedgewebview2.exe
echo Uninstalling Microsoft Edge...

REM Attempting to uninstall Microsoft Edge via official method
cd "%ProgramFiles(x86)%\Microsoft\Edge\Application\*\Installer"
setup.exe --uninstall --system-level --verbose-logging --force-uninstall

REM Delete the Edge folder manually if the uninstallation fails
if exist "%ProgramFiles(x86)%\Microsoft\Edge" (
    rmdir /S /Q "%ProgramFiles(x86)%\Microsoft\Edge"
)

cls
call :logo
echo Microsoft Edge has been uninstalled.
pause
goto :init

:unins_ie
echo Uninstalling Internet Explorer...

REM Remove Internet Explorer from Program Files (x86)
if exist "%ProgramFiles(x86)%\Internet Explorer" (
    rmdir /S /Q "%ProgramFiles(x86)%\Internet Explorer"
)

REM Remove Internet Explorer from Program Files
if exist "%ProgramFiles%\Internet Explorer" (
    rmdir /S /Q "%ProgramFiles%\Internet Explorer"
)

cls
call :logo
echo Internet Explorer has been uninstalled.
pause
goto :init

:unins_both
call :unins_edge
call :unins_ie
cls
call :logo
echo Both Microsoft Edge and Internet Explorer have been uninstalled.
pause
goto :init

:exit
exit

:logo
echo    8888888-888888-  888888- 8888888-888888- 888-   888-88-888-   88- 88888- 88888888-8888888-888888- 
echo    88------88---88-88------ 88------88---88-8888- 8888-88-8888-  88-88---88----88----88------88---88-
echo    88888-  88-  88-88-  888-88888-  888888--88-8888-88-88-88-88- 88-8888888-   88-   88888-  88-  88-
echo    88----  88-  88-88-   88-88----  88---88-88--88--88-88-88--88-88-88---88-   88-   88----  88-  88-
echo    8888888-888888---888888--8888888-88-  88-88- --- 88-88-88- -8888-88-  88-   88-   8888888-888888--
echo    ---------------  ------- -----------  ------     ---------  --------  ---   ---   --------------- 
