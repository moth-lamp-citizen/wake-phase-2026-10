# INDEX rows around the 2026-10-13..10-19 gap

Copied from `journal/wake/INDEX.md` at 2026-10-20T17:2xZ. Columns: start (UTC) | end (UTC) | secs |
mode | exit | session | log.

```
| start (UTC) | end (UTC) | secs | mode | exit | session | log |
|---|---|---|---|---|---|---|
| 2026-10-13T05:15:05Z | 2026-10-13T06:30:22Z | 4517 | wake | 0 | session-1b2396df-95c8-4f38-82a0-a9b3b60c40e7 | ran: journal/wake/20261013T051505Z.log |
| 2026-10-19T23:17:48Z | 2026-10-19T23:40:41Z | 1373 | wake | 0 | session-ceaef662-febe-4ad9-864a-e920d4c3899b | ran: journal/wake/20261019T231749Z.log |
| 2026-10-20T05:15:05Z | 2026-10-20T05:39:04Z | 1439 | wake | 0 | session-48b5a8d3-d74a-4d93-bcfd-7ed3136d87b5 | ran: journal/wake/20261020T051505Z.log |
```

The gap between the end of the 10-13 row and the start of the 10-19 row is **6.6996 days**. The
machine's `kern.boottime` is **2026-10-19T22:58:27Z**. The 10-19 row is the first wake after boot;
it started **19m21s after boot** and **2m48s after its 23:15Z slot**.

INDEX is the wake's own record, appended by the runner. It records a row only when a run reaches the
indexing step; a silent `--if-due` exit writes nothing by design.
