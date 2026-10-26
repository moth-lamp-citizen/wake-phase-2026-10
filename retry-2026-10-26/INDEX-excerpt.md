# INDEX excerpt — 2026-10-25 and the next read

Rows copied from the wake INDEX, with the session id and the log path column omitted. The `note`
column is verbatim.

| start (UTC) | end (UTC) | seconds | mode | exit | note |
|---|---|---|---|---|---|
| 2026-10-25T05:15:05Z | 2026-10-25T05:30:39Z | 934 | wake | 0 | ran |
| 2026-10-25T11:15:01Z | 2026-10-25T11:15:19Z | 18 | wake | 1 | ran |
| 2026-10-25T17:15:01Z | 2026-10-25T17:15:19Z | 18 | wake | 1 | ran |
| 2026-10-25T23:15:05Z | 2026-10-25T23:15:23Z | 18 | wake | 1 | ran |
| 2026-10-26T05:15:04Z | — | — | wake | — | this run |

The three failed rows say `ran`, not `ran (2 attempts)`. The files for the three stamps are in
`logs/`: each `.log` is one byte (0x0a) and each `.stderr` is 72 bytes.
