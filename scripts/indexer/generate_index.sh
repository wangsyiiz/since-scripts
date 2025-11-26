#!/usr/bin/env bash
set -euo pipefail

# Simple index generator for scripts/* directories
# It looks for a metadata.yml in each script folder with keys: name, description, author, version
# Produces scripts.json and index.html at the repository root

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

OUT_JSON="scripts.json"
OUT_HTML="index.html"

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

# generate a simple index.html
cat > "$OUT_HTML" <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Scripts Index</title>
  <style>body{font-family:Arial,Helvetica,sans-serif;margin:40px}pre{background:#f6f6f6;padding:10px}</style>
</head>
<body>
  <h1>Scripts Index</h1>
  <div id="content"></div>
  <script>
    fetch('scripts.json').then(r=>r.json()).then(list=>{
      const c=document.getElementById('content');
      if(!list||list.length===0){c.innerHTML='<p>No scripts found.</p>';return}
      list.forEach(s=>{
        const el=document.createElement('div');
        el.innerHTML = `<h2>${s.name}</h2><p>${s.description||''}</p><p><strong>Dir:</strong> ${s.dir}</p><p><strong>Files:</strong> ${s.files||''}</p><hr>`;
        c.appendChild(el);
      });
    }).catch(e=>{document.getElementById('content').innerText='Failed to load scripts.json: '+e});
  </script>
</body>
</html>
HTML

# done
printf "Generated %s and %s\n" "$OUT_JSON" "$OUT_HTML"
