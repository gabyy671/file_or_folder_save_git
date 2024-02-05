@echo off

REM Nom du dossier source à copier
set "dossier_destination=C:\Users\maxime\AppData\Roaming\.minecraft\saves"
set "fichier_log=%CD%\git_pull_log.txt"
git pull > "%fichier_log%" 2>&1
REM Dossier de destination (répertoire du script)
set "source=%CD%\world"

REM Créer le dossier de destination s'il n'existe pas
cd %dossier_destination% mkdir "world"

REM Copier le contenu du dossier source dans le dossier de destination
xcopy /Y /E "%source%" "%dossier_destination%\world\"

echo Copie terminée. Les fichiers sont dans "%source%"

pause