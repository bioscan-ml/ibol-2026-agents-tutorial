#!/usr/bin/env bash
# Fetch public BOLD records for beetles (Coleoptera) collected in Thailand, as TSV,
# from the BOLD portal API, remove the identifier_email column, and replace e-mail addresses in other fields (taxonomy_notes holds some).
# Writes bold-thailand-coleoptera.tsv next to this script (about 20 MB).
# On 2026-10-28 the file had 12,003 rows (11,831 specimens); BOLD changes, so yours may differ.
# Needs bash, curl and python3. Runs from any working directory.
set -euo pipefail
cd "$(dirname "$0")"
api=https://portal.boldsystems.org/api
out=bold-thailand-coleoptera.tsv
raw=$(mktemp ./bold-download.XXXXXX)
trap 'rm -f "$raw"' EXIT

echo "Asking BOLD for Thai Coleoptera records..."
qid=$(curl -sf --max-time 90 "$api/query?query=geo:country/ocean:Thailand;tax:order:Coleoptera&extent=full" |
  python3 -I -c "import json,sys; print(json.load(sys.stdin)['query_id'])")

echo "Downloading (about 20 MB)..."
curl -sfL --retry 3 --max-time 600 -o "$raw" "$api/documents/$qid/download?format=tsv"

echo "Removing e-mail addresses..."
python3 -I - "$raw" "$out" <<'PY'
import csv, re, sys
EMAIL = re.compile(r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}")
csv.field_size_limit(10**9)
r = csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8"), delimiter="\t")
fields = [f for f in r.fieldnames if f != "identifier_email"]
w = csv.DictWriter(open(sys.argv[2], "w", newline="", encoding="utf-8"), fieldnames=fields,
                   delimiter="\t", lineterminator="\n", extrasaction="ignore")
w.writeheader()
n = 0
for row in r:
    w.writerow({k: EMAIL.sub("[email removed]", v or "") for k, v in row.items()})
    n += 1
print(f"Wrote {sys.argv[2]}: {n} rows, {len(fields)} columns")
PY
echo "Saved to $(pwd)/$out"
