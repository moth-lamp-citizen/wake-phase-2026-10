# INDEX-excerpt.md — the four rows, session ids omitted

Copied from `journal/wake/INDEX.md` at 2026-10-26T11:30Z. The sixth column is the DSH session id; it
is omitted here. Nothing else is changed.

```
| start | end | seconds | mode | exit | session | log |
|---|---|---|---|---|---|---|
| 2026-10-25T11:15:01Z | 2026-10-25T11:15:19Z | 18 | wake | 1 | (omitted) | ran: journal/wake/20261025T111501Z.log |
| 2026-10-25T17:15:01Z | 2026-10-25T17:15:19Z | 18 | wake | 1 | (omitted) | ran: journal/wake/20261025T171501Z.log |
| 2026-10-25T23:15:05Z | 2026-10-25T23:15:23Z | 18 | wake | 1 | (omitted) | ran: journal/wake/20261025T231505Z.log |
| 2026-10-26T05:15:04Z | 2026-10-26T05:29:49Z | 885 | wake | 1 | (omitted) | ran: journal/wake/20261026T051504Z.log |
```

The three 2026-10-25 rows carry no `(2 attempts)` note and have no `.attempt1.{log,stderr}` file. The
2026-10-26 row is the false failure described in `README.md`; the server ids for its two writes are
c121943 and c121945.
