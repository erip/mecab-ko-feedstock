mkdir "%PREFIX%\etc"
if errorlevel 1 exit 1

cd src 
if errorlevel 1 exit 1
nmake -f %RECIPE_DIR%\Makefile.msvc.x64.in 
if errorlevel 1 exit 1

cp mecab.h "%LIBRARY_INC%"
if errorlevel 1 exit 1

cp libmecab.* "%LIBRARY_BIN%"
if errorlevel 1 exit 1

cp *.exe "%LIBRARY_BIN%"
if errorlevel 1 exit 1

if errorlevel 1 exit /b 1
