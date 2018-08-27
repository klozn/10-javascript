@ECHO off

SETLOCAL ENABLEDELAYEDEXPANSION

REM -----------------------------------------------------------------------------------
REM Script ter generatie van .html revealjs slideshows (komen in subfolder /labs)
REM -----------------------------------------------------------------------------------
REM USAGE in CMD: > generate_labs_slideshows
REM -----------------------------------------------------------------------------------

ECHO Generating slideshows for your labs

FOR /r %%f IN (../labs/*-lab*.md) DO (
    SET "filename=%%~nf"
    pandoc -t revealjs -V theme=switchfully -V history=true -V slideNumber=true -V revealjs-url=../start/labs/js/reveal.js -s ../labs-source/!filename!.md -o ../start/labs/!filename!.html
    ECHO    slideshow for !filename! generated
)

ECHO Done generating