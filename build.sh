#!/usr/bin/env bash
set -o errexit

if ! command -v ffmpeg >/dev/null 2>&1; then
  apt-get update
  apt-get install -y ffmpeg
fi

python -m pip install \
  --disable-pip-version-check \
  --prefer-binary \
  --retries 10 \
  --timeout 120 \
  -r requirements.txt
