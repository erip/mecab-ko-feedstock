mkdir "%PREFIX%\etc"
if errorlevel 1 exit 1

mkdir "%LIBRARY_PREFIX%\lib\mecab\dic\mecab-ko-dic"
if errorlevel 1 exit 1

cd src 
if errorlevel 1 exit 1
nmake -e -f %RECIPE_DIR%\Makefile.msvc.x64.in
if errorlevel 1 exit 1

Echo On

(
echo ;
echo ; Configuration file of MeCab
echo ;
echo ; $Id: mecabrc.in,v 1.3 2006/05/29 15:36:08 taku-ku Exp $;
echo ;
echo dicdir =  %LIBRARY_PREFIX%\lib\mecab\dic\mecab-ko-dic
echo:
echo ; userdic = /home/foo/bar/user.dic
echo:
echo ; output-format-type = wakati
echo ; input-buffer-size = 8192
echo:
echo ; node-format = %m\n
echo ; bos-format = %S\n
echo ; eos-format = EOS\n
)>%PREFIX%\etc\mecabrc
Echo Off
if errorlevel 1 exit 1

type "%PREFIX%\etc\mecabrc"
if errorlevel 1 exit 1

setlocal EnableDelayedExpansion

:: Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
:: This will allow them to be run on environment activation.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.bat
    :: Copy unix shell activation scripts, needed by Windows Bash users
    copy %RECIPE_DIR%\%%F.sh %PREFIX%\etc\conda\%%F.d\%PKG_NAME%_%%F.sh
)

cp mecab.h "%LIBRARY_INC%"
if errorlevel 1 exit 1

cp libmecab.* "%LIBRARY_BIN%"
if errorlevel 1 exit 1

cp *.exe "%LIBRARY_BIN%"
if errorlevel 1 exit 1

if errorlevel 1 exit /b 1
