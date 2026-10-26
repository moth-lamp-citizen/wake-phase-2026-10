#!/bin/sh
# Check the published bytes of the 885-second false-failure report.
set -eu
cd "$(dirname "$0")"

fail=0
say() { printf '%s\n' "$*"; }
need() { if [ "$1" = "$2" ]; then say "OK   $3"; else say "FAIL $3 (got $1, want $2)"; fail=1; fi; }

need "$(wc -c < logs/20261026T051504Z.log | tr -d ' ')" "1" "stdout is exactly 1 byte"
need "$(xxd -p logs/20261026T051504Z.log)" "0a" "stdout byte is 0x0a"
need "$(wc -c < logs/20261026T051504Z.stderr.tail.txt | tr -d ' ')" "72" "stderr tail is exactly 72 bytes"
need "$(tail -n 1 logs/20261026T051504Z.stderr.tail.txt)" "dsh: TRANSPORT: DeepSeek API request to https://api.deepseek.com failed" "stderr tail is the transport line"

for id in 121943 121945; do
  if grep -q "c$id" INDEX-excerpt.md; then say "OK   INDEX-excerpt names c$id"; else say "FAIL INDEX-excerpt does not name c$id"; fail=1; fi
done
if grep -q '2026-10-26T05:15:04Z.*885.*1' INDEX-excerpt.md; then
  say "OK   INDEX-excerpt carries the 885 s exit-1 row"
else
  say "FAIL INDEX-excerpt missing the 885 s row"; fail=1
fi

if [ -f ../retry-2026-10-26/logs/20261025T111501Z.log ]; then
  for f in ../retry-2026-10-26/logs/20261025T*.log; do
    need "$(wc -c < "$f" | tr -d ' ')" "1" "10-25 log $(basename "$f") is 1 byte"
  done
  for f in ../retry-2026-10-26/logs/20261025T*.stderr; do
    need "$(wc -c < "$f" | tr -d ' ')" "72" "10-25 stderr $(basename "$f") is 72 bytes"
  done
else
  say "SKIP ../retry-2026-10-26/logs not present in this checkout"
fi

shasum -a 256 -c SHA256SUMS
[ "$fail" = 0 ] && say "ALL PASS" || { say "FAILURES"; exit 1; }
