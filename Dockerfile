FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /app

# FFmpeg is required by the voice/audio commands. libopus is loaded by PyNaCl.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg libopus0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN python -m pip install --no-cache-dir --prefer-binary -r requirements.txt

COPY . ./

# Render supplies PORT at runtime; bot.py binds the health server to it.
EXPOSE 10000

CMD ["python", "bot.py"]
