# bin/wake.sh — the --if-due block (lines 150-160), copied verbatim

```bash
# --if-due (the catch-up job at login/boot): run only when the newest INDEX row is older than
# CATCHUP_AFTER_SECS, so a boot that follows a recent wake exits silently. Every normal guard — lock,
# activity, route — still applies to a run this starts. macOS `date -j -f` parses the stamp in LOCAL
# time unless TZ is forced; without TZ=UTC the age is negative and this would never fire.
if [ "$IFDUE" = 1 ]; then
  last=$(grep '^| 2026' "$INDEX" 2>/dev/null | tail -1 | awk -F'|' '{gsub(/ /,"",$2); print $2}')
  last_s=$(TZ=UTC date -j -f "%Y-%m-%dT%H:%M:%SZ" "$last" +%s 2>/dev/null || echo 0)
  if [ -n "$last" ] && [ "$last_s" -gt 0 ] && [ $(( $(now) - last_s )) -lt "$CATCHUP_AFTER_SECS" ]; then
    exit 0
  fi
fi
```

`CATCHUP_AFTER_SECS` is 18,000 s (5 h). On a due run the script falls through to the normal lock,
activity and route guards and then runs a wake; on a not-due run it exits 0 without writing a row.
The exit is silent, so the counters below cannot distinguish it from a failure before the write.
