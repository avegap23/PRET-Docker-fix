FROM python:2.7-slim

LABEL maintainer="avegap23"
LABEL description="Dockerized PRET (Printer Exploitation Toolkit) --APT fix--"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Update APT sources to use Debian Buster archive
RUN echo "deb http://archive.debian.org/debian/ buster main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        libusb-1.0-0 \
        libusb-1.0-0-dev \
        imagemagick \
        ghostscript \
        && rm -rf /var/lib/apt/lists/*

# Clone PRET repository
RUN git clone https://github.com/RUB-NDS/PRET.git /app

# Install Python dependencies
RUN pip install --no-cache-dir colorama pysnmp requests

# Set default command
ENTRYPOINT ["python", "pret.py"]
