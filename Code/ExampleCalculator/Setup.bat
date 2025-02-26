@echo off
SET D="C:\HaxeToolkit"

:: Check if Haxe is installed
if not exist %D% (
    echo Haxe is not installed. Please install Haxe, then run setup again.
    GOTO mylabel
)

echo Haxe is installed, continuing...
echo Please wait while dependencies are installed.
echo This might take a moment depending on your internet connection speed.

:: Install dependencies
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install flixel-ui
haxelib install lime

:: Test lime command
echo Running lime command as a test...
lime

echo Installation complete.
setlocal

:PROMPT
SET /P AREYOUSURE=Would you like to run lime setup (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
lime setup

:END
echo Understood. Setup is complete.
endlocal
pause
exit /b

:mylabel
echo ERROR: HAXE_NOT_INSTALLED
pause
exit /b
