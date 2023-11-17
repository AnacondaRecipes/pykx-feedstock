:: avoid distributing unnecessary shared objects depending on the platform
del /q /s %SRC_DIR%\src\%PKG_NAME%\lib\l64 %SRC_DIR%\src\%PKG_NAME%\lib\l64arm %SRC_DIR%\src\%PKG_NAME%\lib\m64 %SRC_DIR%\src\%PKG_NAME%\lib\m64arm

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: set Path variable to resolve location of q.dll
set PATH=%SP_DIR%\%PKG_NAME%\lib\w64;%PATH%
