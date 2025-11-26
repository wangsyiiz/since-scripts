#!/usr/bin/env bash
set -euo pipefail

# Simple index generator for scripts/* directories
# It looks for a metadata.yml in each script folder with keys: name, description, author, version
# Produces scripts.json at the repository root. It no longer overwrites index.html to avoid UI changes.

# When moved to tools/indexer, compute repository root reliably (two levels up from this script)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

OUT_JSON="scripts.json"

# start JSON array
echo "[" > "$OUT_JSON"
first=true
for d in scripts/*/; do
  [ -d "$d" ] || continue
  meta="$d/metadata.yml"
  name="$(basename "$d")"
  description=""
  author=""
  version=""
  entry=""
  if [ -f "$meta" ]; then
    # crude YAML parsing: look for 'key: value' at line start
    description=$(grep -E '^description:' "$meta" | sed 's/^description:[[:space:]]*//' | sed 's/^"\|"$//g') || true
    author=$(grep -E '^author:' "$meta" | sed 's/^author:[[:space:]]*//' | sed 's/^"\|"$//g') || true
    version=$(grep -E '^version:' "$meta" | sed 's/^version:[[:space:]]*//' | sed 's/^"\|"$//g') || true
    name_val=$(grep -E '^name:' "$meta" | sed 's/^name:[[:space:]]*//' | sed 's/^"\|"$//g' || true)
    if [ -n "$name_val" ]; then name="$name_val"; fi
  fi
  # find executable files in folder
  exec_files="$(find "$d" -maxdepth 1 -type f -perm /111 -printf '%f,' | sed 's/,$//')"
  # fallback to any .sh
  if [ -z "$exec_files" ]; then
    exec_files="$(find "$d" -maxdepth 1 -type f -name '*.sh' -printf '%f,' | sed 's/,$//')"
  fi

  # build JSON object
  if [ "$first" = true ]; then
    first=false
  else
    echo "," >> "$OUT_JSON"
  fi
  cat >> "$OUT_JSON" <<EOF
  {
    "dir": "${d%/}",
    "name": "${name}",
    "description": "${description}",
    "author": "${author}",
    "version": "${version}",
    "files": "${exec_files}"
  }
EOF

done
# end JSON array
echo "\n]" >> "$OUT_JSON"

# done
printf "Generated %s\n" "$OUT_JSON"
