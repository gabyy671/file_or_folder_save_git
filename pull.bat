@echo off

REM Nom du dossier source à copier
set "dossier_destination=C:\Users\maxime\AppData\Roaming\.minecraft\saves"

REM Dossier de destination (répertoire du script)
set "source=%CD%\world"

REM Créer le dossier de destination s'il n'existe pas
cd %dossier_destination% mkdir "world"

REM Copier le contenu du dossier source dans le dossier de destination
xcopy /Y /E "%source%" "%dossier_destination%\world\"

echo Copie terminée. Les fichiers sont dans "%source%"

pause