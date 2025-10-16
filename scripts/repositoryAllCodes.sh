#!/usr/bin/env bash

OUTPUT="all_files.md"
>"$OUTPUT"

rm $OUTPUT

find . -type d -name ".git" -prune -o \
  -type f ! -name "$OUTPUT" \
  ! -iname ".DS_Store" ! -iname "*.json" ! -iname "*.jpeg" ! -iname "*.jpg" ! -iname "*.webp" ! -iname "*.png" ! -iname "*.mp4" ! -iname "*.gif" \
  -print | while read -r file; do
  filename=$(basename "$file")
  ext="${filename##*.}"
  # 拡張子が無い場合はtxtにする
  if [[ "$filename" == "$ext" ]]; then
    ext="txt"
  fi
  echo "## $file" >>"$OUTPUT"
  echo "\`\`\`$ext" >>"$OUTPUT"
  cat "$file" >>$OUTPUT
  echo "\`\`\`" >>"$OUTPUT"
  echo "" >>"$OUTPUT"
done
