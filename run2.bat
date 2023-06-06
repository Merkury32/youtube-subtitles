@echo off

setlocal enabledelayedexpansion

set /p "link=Podaj link do filmu: "
for /f "tokens=2 delims==" %%i in ("%link%") do (
    set "datestamp=!date:~0,2!-!date:~3,2!-!date:~8,2!"
    set "filename=!datestamp!_%%i.mp4"
)

docker run -it --rm -v "%cd%":/app youtube-subtitles yt-dlp -o "/app/!filename!" -f mp4 "%link%"
