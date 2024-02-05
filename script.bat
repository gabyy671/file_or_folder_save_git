@echo off

REM Chemin du dossier ou du fichier source
set "source=C:\Users\maxime\Documents\test\heeey"

REM Vérifier si le chemin spécifié est un dossier ou un fichier
if exist "%source%\*" (
    REM C'est un dossier
    set "est_dossier=true"
) else (
    REM C'est un fichier
    set "est_dossier=false"
)

REM Dossier de destination (répertoire actuel)
set "dossier_destination=%CD%"

REM Nom du fichier journal (log)
set "fichier_log=%dossier_destination%\git_log.txt"

REM Copier le dossier ou le fichier dans le dossier spécifié
if %est_dossier%==true (
    xcopy /Y /E /I "%source%" "%dossier_destination%"
) else (
    copy /Y "%source%" "%dossier_destination%"
)

REM Aller dans le dossier de destination
cd /D "%dossier_destination%" || exit /B 1

REM Ajouter le dossier ou le fichier au suivi de Git
git add .

REM Demander le message de commit à l'utilisateur
set /p commit_message=Entrez le message de commit : 

REM Effectuer un commit avec le message fourni
git commit -m "%commit_message%" > "%fichier_log%" 2>&1

REM Pousser les modifications vers le référentiel distant
::git push origin main >> "%fichier_log%" 2>&1
