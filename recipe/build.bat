:: avoid distributing unnecessary shared objects depending on the platform
del /q /s %SRC_DIR%\src\%PKG_NAME%\lib\l64 %SRC_DIR%\src\%PKG_NAME%\lib\l64arm %SRC_DIR%\src\%PKG_NAME%\lib\m64 %SRC_DIR%\src\%PKG_NAME%\lib\m64arm

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: set Path variable to resolve location of q.dll
set PATH=%SP_DIR%\%PKG_NAME%\lib\w64;%PATH%

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
)
