@echo off
setlocal enabledelayedexpansion

:: Sprawdź czy plik .env istnieje i załaduj zmienne
if exist .env (
    for /f "usebackq delims=" %%i in (".env") do (
        set "%%i"
    )
)

:: Przejdź do katalogu nadrzędnego
cd ..

:: Przetwarzaj repozytoria
for %%r in (
    Cerebritron_HAL
    Cerebritron_AC
    Cerebritron_PS
    Cerebritron_SM
    Cerebritron_CC
    Cerebritron_Core
) do (
    if exist "%%r" (
        echo Updating %%r
        cd "%%r"
        git -c credential.helper= -c credential.helper="!f() { echo username=!GITHUB_TOKEN!; echo password=x-oauth-basic; }; f" pull
        cd ..
    ) else (
        echo Cloning %%r
        git clone https://!GITHUB_TOKEN!@github.com/Pioxolotl/%%r.git
    )
)

:: Wróć do katalogu głównego
cd Cerebritron

echo Updating complete
