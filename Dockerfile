# Pobieranie obrazu bazowego node i python
FROM node:latest AS node
FROM python:latest AS python

# Instalacja ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Instalacja youtube-dl
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl

# Tworzenie ostatecznego obrazu
FROM node
COPY --from=python / /
COPY --from=node / /