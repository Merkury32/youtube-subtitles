@echo off

setlocal enabledelayedexpansion

set /p "link=Podaj link do filmu: "
for /f "tokens=2 delims==" %%i in ("%link%") do (
    set "datestamp=!date:~0,2!-!date:~3,2!-!date:~8,2!"
    set "filename=!datestamp!_%%i.mp4"
)

docker run -it --rm -v "%cd%":/app youtube-subtitles yt-dlp -o "/app/!filename!" -f mp4 "%link%"

set "mp3filename=!filename:.mp4=.mp3!"

docker run -v "%cd%":/app youtube-subtitles sh -c "ffmpeg -i '/app/!filename!' -vn -ar 44100 -ac 2 -b:a 192k '/app/!mp3filename!'"

@pause