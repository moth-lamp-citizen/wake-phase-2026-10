#!/bin/bash
# Test the retry predicate against the shapes it must separate. Local only; no model, no network.
set -u
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
OLD_FAIL=0; NEW_FAIL=0
old_retry() { [ "$CODE" != 0 ] && [ ! -s "$LOG" ] && [ "$(wc -c <"$ERR" | tr -d ' ')" -le 512 ] && [ "$ELAPSED" -lt 300 ]; }
new_retry() { local t; t=$(tr -d '[:space:]' <"$LOG" | wc -c | tr -d ' '); [ "$CODE" != 0 ] && [ "$t" -eq 0 ] && [ "$(wc -c <"$ERR" | tr -d ' ')" -le 512 ] && [ "$ELAPSED" -lt 300 ]; }
run_case() { # name expect_old expect_new code logfile errbytes elapsed
  local name="$1" eo="$2" en="$3"; CODE="$4"; LOG="$5"; ERR="$TMP/err"; ELAPSED="$7"
  if [ "$6" -gt 0 ]; then head -c "$6" /dev/zero | tr '\0' 'x' > "$ERR"; else : > "$ERR"; fi
  old_retry; local o=$?; new_retry; local n=$?
  [ "$o" -eq 0 ] && o=1 || o=0; [ "$n" -eq 0 ] && n=1 || n=0
  local ok=1
  [ "$o" = "$eo" ] || ok=0
  [ "$n" = "$en" ] || ok=0
  printf '%-34s old=%s (want %s)  new=%s (want %s)  %s\n' "$name" "$o" "$eo" "$n" "$en" "$([ "$ok" = 1 ] && echo PASS || echo FAIL)"
  [ "$ok" = 1 ] || { OLD_FAIL=$((OLD_FAIL+1)); NEW_FAIL=$((NEW_FAIL+1)); }
}
printf '\n' > "$TMP/newline.log"          # the real 2026-10-22 shape: 1 byte
: > "$TMP/empty.log"                        # the 2026-10-06 stub shape: 0 bytes
head -c 10267 /dev/zero | tr '\0' 'r' > "$TMP/reason.log"
printf 'stub success\n' > "$TMP/success.log"
run_case 'real transport death (1-byte log)' 0 1 1 "$TMP/newline.log" 72 18
run_case 'stub shape (0-byte log)'           1 1 1 "$TMP/empty.log"   72 18
run_case 'reasoned run (10,267-byte log)'    0 0 1 "$TMP/reason.log"  10267 167
run_case 'stderr over 512 bytes'             0 0 1 "$TMP/newline.log" 513 18
run_case 'elapsed over 300 s'                0 0 1 "$TMP/newline.log" 72 400
run_case 'exit 0 (no retry)'                 0 0 0 "$TMP/success.log" 0 10
echo
[ "$OLD_FAIL" = 0 ] && [ "$NEW_FAIL" = 0 ] && { echo 'ALL PASS'; exit 0; } || { echo 'FAILURES'; exit 1; }
