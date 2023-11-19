@echo off
setlocal enabledelayedexpansion

:: Define el nombre del script actual
set "scriptName=organizador.bat"

:: Define las extensiones y las carpetas de destino
set "imageFolder=Imagenes"
set "videosFolder=Videos"
set "audiosFolder=Audios"
set "rarFolder=Comprimidos"
set "docFolder=Documentos"
set "pptFolder=!docFolder!\PowerPoint"
set "wordFolder=!docFolder!\Word"
set "pdfFolder=!docFolder!\PDF"
set "excelFolder=!docFolder!\Excel"
set "txtFolder=!docFolder!\Txt"
set "svgFolder=!docFolder!\Svg"
set "drawioFolder=!docFolder!\Drawio"
set "otherFolder=Otros"

:: Crea las carpetas si no existen
if not exist "!imageFolder!" mkdir "!imageFolder!"
if not exist "!videosFolder!" mkdir "!videosFolder!"
if not exist "!audiosFolder!" mkdir "!audiosFolder!"
if not exist "!rarFolder!" mkdir "!rarFolder!"
if not exist "!docFolder!" mkdir "!docFolder!"
if not exist "!pptFolder!" mkdir "!pptFolder!"
if not exist "!wordFolder!" mkdir "!wordFolder!"
if not exist "!pdfFolder!" mkdir "!pdfFolder!"
if not exist "!excelFolder!" mkdir "!excelFolder!"
if not exist "!txtFolder!" mkdir "!txtFolder!"
if not exist "!svgFolder!" mkdir "!svgFolder!"
if not exist "!drawioFolder!" mkdir "!drawioFolder!"
if not exist "!otherFolder!" mkdir "!otherFolder!"

:: Mueve los archivos a las carpetas correspondientes
for %%i in (*.jpg *.jpeg *.png *.gif *.ico) do move "%%i" "!imageFolder!"
for %%i in (*.mp4 *.avi *.mkv *.mov *.wmv *.flv *.webm *.mpeg) do move "%%i" "!videosFolder!"
for %%i in (*.mp3 *.wav *.flac *.ogg *.aac *.wma *.m4a) do move "%%i" "!audiosFolder!"
for %%i in (*.rar *.zip *.tar.gz *.7z) do move "%%i" "!rarFolder!"
for %%i in (*.docx *.doc) do move "%%i" "!wordFolder!"
for %%i in (*.ppt) do move "%%i" "!pptFolder!"
for %%i in (*.pdf) do move "%%i" "!pdfFolder!"
for %%i in (*.xlsx) do move "%%i" "!excelFolder!"
for %%i in (*.txt) do move "%%i" "!txtFolder!"
for %%i in (*.svg) do move "%%i" "!svgFolder!"
for %%i in (*.drawio) do move "%%i" "!drawioFolder!"

:: Mueve los archivos restantes a la carpeta "Otros"
for %%i in (*) do (
    if not "%%~nxi"== "!scriptName!" (
        if not "%%~ni"=="!scriptName:~0,-4!" (
            move "%%i" "!otherFolder!"
        )
    )
)

echo Organización completada.
pause
