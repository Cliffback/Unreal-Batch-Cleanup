@ECHO OFF

echo Unreal Cleanup Script
echo Client directory: %~dp0
pushd "%~dp0"

echo 1 - Project 1
echo 2 - Project 2
echo 3 - Exit

:choice
set /P c=What projects do you want to clean?[1/2/3]? (default = Project 1)
if /I "%c%" EQU "1" goto :project1
if /I "%c%" EQU "2" goto :project2
if /I "%c%" EQU "3" goto :exit
if /I "%c%" EQU "" goto :jumpman

goto :choice

:project1

echo Cleaning up Project 1
cd project1
goto :clean

:project2

echo Cleaning up Project 2
cd project2
goto :clean

:clean

@RD /S /Q "Intermediate"
@RD /S /Q "Binaries"
@RD /S /Q "DerivedDataCache"
:: Deletes saved source control settings @RD /S /Q "Saved"
del /S *.sln


:choice2
set /P c=Clean plugins as well?[Y/N]? (default = no) 
if /I "%c%" EQU "Y" goto :plugins
if /I "%c%" EQU "N" goto :cleaned
if /I "%c%" EQU "" goto :cleaned

goto :choice2

:plugins
for /d %%a in (
    "Plugins\*"
) do if exist "%%~fa\Intermediate\" rmdir /s /q "%%~fa\Intermediate" do if exist "%%~fa\Binaries\" rmdir /s /q "%%~fa\Binaries"

for /d %%a in (
    "Plugins\Developer\*"
) do if exist "%%~fa\Intermediate\" rmdir /s /q "%%~fa\Intermediate" do if exist "%%~fa\Binaries\" rmdir /s /q "%%~fa\Binaries"

:cleaned
echo Project cleaned

set /P c=Run Unreal Project?[Y/N]? (default = Yes)
if /I "%c%" EQU "Y" goto :run
if /I "%c%" EQU "N" goto :exit
if /I "%c%" EQU "N" goto :run

:run

for /r %%x in (*.uproject) do "%%x"

:exit
echo Exiting
