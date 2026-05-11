#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="${1:-$HOME/Pictures/wallpapers}"

mapfile -t images < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \
  -o -iname '*.webp' -o -iname '*.gif' \))

if [ ${#images[@]} -eq 0 ]; then
  echo "Nenhuma imagem encontrada em $WALLPAPER_DIR" >&2
  exit 1
fi

chosen="${images[RANDOM % ${#images[@]}]}"

awww img "$chosen" \
  --transition-type center \
  --transition-duration 2 \
  --transition-fps 60
