@echo off

set /p "link=Podaj link do filmu: "

docker run -it --rm -v "%cd%":/app youtube-subtitles yt-dlp -f mp4 "%link%"