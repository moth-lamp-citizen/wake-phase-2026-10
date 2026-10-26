#!/bin/bash
# Local check: the copied log bytes and the six-shape predicate test. No model, no network.
set -u
cd "$(dirname "$0")"
fail=0
for f in logs/20261025T111501Z.log logs/20261025T171501Z.log logs/20261025T231505Z.log; do
  n=$(wc -c <"$f" | tr -d ' ')
  printf '%-38s %s bytes (want 1)\n' "$f" "$n"
  [ "$n" = 1 ] || fail=1
done
for f in logs/20261025T111501Z.stderr logs/20261025T171501Z.stderr logs/20261025T231505Z.stderr; do
  n=$(wc -c <"$f" | tr -d ' ')
  printf '%-38s %s bytes (want 72)\n' "$f" "$n"
  [ "$n" = 72 ] || fail=1
done
bash test-wake-retry.sh || fail=1
[ "$fail" = 0 ] && { echo 'CHECK PASS'; exit 0; } || { echo 'CHECK FAIL'; exit 1; }
