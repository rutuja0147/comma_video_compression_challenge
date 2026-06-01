#!/usr/bin/env bash
set -euo pipefail
ARCHIVE_DIR="$1"
INFLATED_DIR="$2"
VIDEO_NAMES_FILE="$3"
mkdir -p "$INFLATED_DIR"
while IFS= read -r line; do
  [ -z "$line" ] && continue
  BASE="${line%.*}"
  ffmpeg -i "$ARCHIVE_DIR/${BASE}.mkv" -f rawvideo -pix_fmt rgb24 "$INFLATED_DIR/${BASE}.raw"
done < "$VIDEO_NAMES_FILE"
