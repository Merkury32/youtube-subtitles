FROM node:latest
FROM python:latest

# Instalacja ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Instalacja yt-dlp
RUN pip install yt-dlp

# Ustawienie ścieżki do Node.js
ENV PATH="/usr/local/bin:${PATH}"

# Utworzenie i ustawienie katalogu roboczego
WORKDIR /app

# Wykonanie wszystkich komend z linii poleceń wewnątrz kontenera
CMD ["/bin/bash"]