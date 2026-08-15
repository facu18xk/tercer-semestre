#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
count=0
while IFS= read -r file; do
  rel="${file#$ROOT/}"
  out="$ROOT/${rel%.rnote}.pdf"
  mkdir -p "$(dirname "$out")"
  rnote-cli export doc -p --on-conflict overwrite -o "$out" "$file"
  count=$((count + 1))
done < <(find "$ROOT/analisis3" "$ROOT/fisica_3" "$ROOT/paradigmas" -name '*.rnote')
echo "Exported $count file(s) -> subject folders"
