@echo off

REM Chemin du fichier source
set "fichier_source=C:\Users\maxime\Documents\test\hellow orld.txt"

REM Dossier de destination (répertoire actuel)
set "dossier_destination=%CD%"

REM Nom du fichier journal (log)
set "fichier_log=%dossier_destination%\git_log.txt"

REM Copier le fichier dans le dossier spécifié (en écrasant s'il existe déjà)
copy /Y "%fichier_source%" "%dossier_destination%"

REM Aller dans le dossier de destination
cd /D "%dossier_destination%" || exit /B 1

REM Ajouter le fichier au suivi de Git
git add .

REM Demander le message de commit à l'utilisateur
set /p commit_message=Entrez le message de commit : 

REM Effectuer un commit avec le message fourni
git commit -m "%commit_message%" > "%fichier_log%" 2>&1

REM Pousser les modifications vers le référentiel distant
git push origin main >> "%fichier_log%" 2>&1
