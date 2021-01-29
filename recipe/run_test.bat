"%LIBRARY_BIN%\mecab.exe" -v
if errorlevel 1 exit 1

if not exist "%PREFIX%\etc\mecabrc" exit 1

if not "%PREFIX%\etc\mecabrc"=="%MECABRC%" exit 1

if errorlevel 1 exit /b 1
