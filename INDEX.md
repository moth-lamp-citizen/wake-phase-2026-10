# Wake index

One row per scheduled or manual wake, appended by `bin/wake.sh`. Logs sit beside this file:
`<stamp>.log` is the final answer (stdout), `<stamp>.stderr` the reasoning stream (0600, may be sensitive).

| start (UTC) | end (UTC) | secs | mode | exit | session | log |
|---|---|---|---|---|---|---|
| 2026-09-23T15:07:09Z | 2026-09-23T15:07:13Z | 4 | smoke | 0 | session-d897e264-91b8-4618-9d1f-681e28776d87 | ran: journal/wake/20260923T150709Z.log |
| 2026-09-23T15:12:13Z | 2026-09-23T15:12:17Z | 4 | smoke | 0 | session-26465efa-c24e-4090-9df8-67746cd0f911 | ran: journal/wake/20260923T151213Z.log |
| 2026-09-23T15:21:26Z | 2026-09-23T15:21:26Z | 0 | smoke | 2 | - | skipped: ~/.dsh default model is kimi-coding/kimi-for-coding-highspeed/low; the wake needs deepseek-official/deepseek-flash/max |
| 2026-09-23T15:22:42Z | 2026-09-23T15:22:49Z | 7 | smoke | 0 | session-96696857-0f48-4725-b4b6-c1397786b08a | ran: journal/wake/20260923T152242Z.log |
| 2026-09-23T17:15:04Z | 2026-09-23T17:26:46Z | 702 | wake | 0 | session-093c3cb6-8deb-4a61-94ea-2bbcbea07277 | ran: journal/wake/20260923T171504Z.log |
| 2026-09-23T23:15:03Z | 2026-09-23T23:31:36Z | 993 | wake | 0 | session-bc545baf-533a-4d89-baed-02480a32c194 | ran: journal/wake/20260923T231503Z.log |
| 2026-09-24T05:15:03Z | 2026-09-24T05:19:40Z | 277 | wake | 0 | session-2f2dd340-cff2-45b5-a78a-410288984a2e | ran: journal/wake/20260924T051503Z.log |
| 2026-09-24T11:15:00Z | 2026-09-24T11:29:16Z | 856 | wake | 0 | session-4d788ba4-c124-4921-b819-ce06db320549 | ran: journal/wake/20260924T111500Z.log |
| 2026-09-24T17:15:03Z | 2026-09-24T17:33:54Z | 1131 | wake | 0 | session-4af45b9d-cb2b-40f9-b0eb-8138a2093f00 | ran: journal/wake/20260924T171503Z.log |
| 2026-09-24T23:15:03Z | 2026-09-24T23:29:40Z | 877 | wake | 0 | session-48d09d50-0707-4811-9e03-b73faf5f3112 | ran: journal/wake/20260924T231503Z.log |
| 2026-09-25T05:15:04Z | 2026-09-25T05:23:37Z | 513 | wake | 0 | session-b80d7a29-4bf0-4660-9fdc-5f934c1682df | ran: journal/wake/20260925T051504Z.log |
| 2026-09-25T11:15:04Z | 2026-09-25T11:22:13Z | 429 | wake | 0 | session-224f6a18-a1cb-4856-aeee-f4396348255e | ran: journal/wake/20260925T111504Z.log |
| 2026-09-25T17:15:04Z | 2026-09-25T17:31:24Z | 980 | wake | 0 | session-bfc4fb05-ea48-4c4d-9df3-c0218c763f76 | ran: journal/wake/20260925T171504Z.log |
| 2026-09-25T23:15:05Z | 2026-09-25T23:23:43Z | 518 | wake | 0 | session-a96e788b-70b8-482e-a702-c308705911a8 | ran: journal/wake/20260925T231505Z.log |
| 2026-09-26T05:15:04Z | 2026-09-26T05:15:04Z | 0 | wake | - | - | skipped: recent operator activity (attended DSH session log 1629s ago) |
| 2026-09-26T11:15:00Z | 2026-09-26T11:29:29Z | 869 | wake | 0 | session-f0368fa6-d34c-4cc9-89ea-1d3c42d6953a | ran: journal/wake/20260926T111500Z.log |
| 2026-09-26T17:15:04Z | 2026-09-26T17:15:04Z | 0 | wake | - | - | skipped: recent operator activity (attended DSH session log 1102s ago) |
| 2026-09-26T23:15:02Z | 2026-09-26T23:15:19Z | 17 | wake | 1 | session-b23880cf-7e27-469e-8356-9e3a885ba54a | ran: journal/wake/20260926T231502Z.log |
| 2026-09-27T05:15:05Z | 2026-09-27T05:28:55Z | 830 | wake | 0 | session-fad326f1-1c84-485c-91c5-1d69aa8e57c2 | ran: journal/wake/20260927T051505Z.log |
| 2026-09-27T11:15:04Z | 2026-09-27T11:26:20Z | 676 | wake | 0 | session-32a26a90-02fa-4e4d-b8b2-2a6255ed425c | ran: journal/wake/20260927T111504Z.log |
| 2026-09-27T17:15:05Z | 2026-09-27T17:45:33Z | 1828 | wake | 0 | session-2626228c-0c58-4a41-bfad-72701e9e1c4d | ran: journal/wake/20260927T171505Z.log |
| 2026-09-27T23:15:04Z | 2026-09-27T23:17:51Z | 167 | wake | 1 | session-1b2773d1-edf3-49b9-ad51-ba8c922f299b | ran: journal/wake/20260927T231504Z.log |
| 2026-09-28T05:15:04Z | 2026-09-28T05:31:34Z | 990 | wake | 0 | session-a9c13595-9ab1-47f2-8293-b0c9b56933c5 | ran: journal/wake/20260928T051504Z.log |
| 2026-09-28T11:15:05Z | 2026-09-28T11:25:44Z | 639 | wake | 0 | session-349a2941-b830-46fa-8d5c-e7243d986d93 | ran: journal/wake/20260928T111505Z.log |
| 2026-09-28T17:15:03Z | 2026-09-28T17:15:21Z | 18 | wake | 1 | session-8304373c-8063-4a53-a98f-53efbb19eb88 | ran: journal/wake/20260928T171503Z.log |
| 2026-09-28T23:15:05Z | 2026-09-28T23:15:22Z | 17 | wake | 1 | session-f92277bf-ce9f-46e4-a940-a6e3f961d3a5 | ran: journal/wake/20260928T231505Z.log |
| 2026-09-29T05:15:05Z | 2026-09-29T05:32:36Z | 1051 | wake | 0 | session-e1e33e0c-5bc3-49c0-b618-9b7a8c915d79 | ran: journal/wake/20260929T051505Z.log |
| 2026-09-29T11:15:03Z | 2026-09-29T11:30:04Z | 901 | wake | 0 | session-a28d3ff9-c0b8-46c0-9fc5-fc447f16503d | ran: journal/wake/20260929T111503Z.log |
| 2026-09-29T17:15:05Z | 2026-09-29T17:41:47Z | 1602 | wake | 0 | session-b57b30b5-4329-4113-b10f-d00e2843dde8 | ran: journal/wake/20260929T171505Z.log |
| 2026-09-29T23:15:05Z | 2026-09-29T23:40:20Z | 1515 | wake | 0 | session-789371a5-760f-4ffd-b757-9a018ab5e84d | ran: journal/wake/20260929T231505Z.log |
| 2026-09-30T05:15:05Z | 2026-09-30T05:27:55Z | 770 | wake | 0 | session-ccc5cf3d-dabe-499c-9026-4427e5910306 | ran: journal/wake/20260930T051505Z.log |
| 2026-09-30T11:15:02Z | 2026-09-30T11:15:21Z | 19 | wake | 1 | session-9badc795-11c2-464f-b5e3-11c39d272981 | ran: journal/wake/20260930T111502Z.log |
| 2026-10-01T05:15:01Z | 2026-10-01T05:31:17Z | 976 | wake | 0 | session-6247cbdd-ce95-4076-b93e-d1112bb79df0 | ran: journal/wake/20261001T051501Z.log |
| 2026-10-01T23:58:26Z | 2026-10-02T00:13:06Z | 880 | wake | 0 | session-d1b96951-aea5-41fe-a9c6-2271abcf39e7 | ran: journal/wake/20261001T235826Z.log |
| 2026-10-02T05:15:03Z | 2026-10-02T05:52:27Z | 2244 | wake | 0 | session-3fe9404c-d743-4f39-bb1a-a42ec0dbfa66 | ran: journal/wake/20261002T051503Z.log |
| 2026-10-02T11:15:03Z | 2026-10-02T11:27:52Z | 769 | wake | 0 | session-49a4ef90-16b4-4197-9e90-055529f0ee36 | ran: journal/wake/20261002T111503Z.log |
| 2026-10-02T17:15:02Z | 2026-10-02T17:41:03Z | 1561 | wake | 0 | session-2b7a902c-12ea-44e9-8bf7-504dd06a084c | ran: journal/wake/20261002T171502Z.log |
| 2026-10-02T23:15:03Z | 2026-10-02T23:26:47Z | 704 | wake | 0 | session-5a0c4af9-46b3-4c12-8693-b36dec5c2d4f | ran: journal/wake/20261002T231503Z.log |
| 2026-10-03T05:15:03Z | 2026-10-03T05:29:10Z | 847 | wake | 0 | session-22e4fc23-b543-4af8-8ac4-c7ef8028e82a | ran: journal/wake/20261003T051503Z.log |
| 2026-10-03T11:15:04Z | 2026-10-03T11:41:37Z | 1593 | wake | 0 | session-1471bc2d-9411-4ea3-8723-92f7c7dacb73 | ran: journal/wake/20261003T111504Z.log |
| 2026-10-03T17:15:05Z | 2026-10-03T17:23:43Z | 518 | wake | 0 | session-aa97c922-4ee4-4239-8e31-236198aa400c | ran: journal/wake/20261003T171505Z.log |
| 2026-10-03T23:15:05Z | 2026-10-03T23:35:17Z | 1212 | wake | 0 | session-a107c725-e2d1-4cf9-997c-05aca63a3a53 | ran: journal/wake/20261003T231505Z.log |
| 2026-10-04T05:15:05Z | 2026-10-04T05:40:42Z | 1537 | wake | 0 | session-ba29889e-61a6-4f44-a2ec-cb990724d1ba | ran: journal/wake/20261004T051505Z.log |
| 2026-10-04T11:15:02Z | 2026-10-04T11:47:22Z | 1940 | wake | 0 | session-ffa63395-11cf-41cb-b041-f34e9861429b | ran: journal/wake/20261004T111502Z.log |
| 2026-10-04T17:15:04Z | 2026-10-04T17:41:05Z | 1561 | wake | 0 | session-4020fd17-69b2-41b9-a73b-418a2bf80bc0 | ran: journal/wake/20261004T171504Z.log |
| 2026-10-04T23:15:01Z | 2026-10-04T23:28:38Z | 817 | wake | 0 | session-eb56a712-d54f-467e-847b-9b2847f31e19 | ran: journal/wake/20261004T231501Z.log |
| 2026-10-05T05:15:05Z | 2026-10-05T06:23:19Z | 4094 | wake | 0 | session-fe62e56b-371b-4611-947f-a1bada8fd78e | ran: journal/wake/20261005T051505Z.log |
| 2026-10-05T11:15:06Z | 2026-10-05T11:47:06Z | 1920 | wake | 0 | session-141a3d7e-c985-4e08-a96e-6fc2ad3b9386 | ran: journal/wake/20261005T111507Z.log |
| 2026-10-05T17:15:03Z | 2026-10-05T17:41:28Z | 1585 | wake | 0 | session-b15395bf-3221-493a-a701-06435db95abc | ran: journal/wake/20261005T171503Z.log |
| 2026-10-05T23:15:03Z | 2026-10-05T23:35:42Z | 1239 | wake | 0 | session-219b1c45-7fb9-416f-8157-4290127b7d51 | ran: journal/wake/20261005T231503Z.log |
| 2026-10-06T05:15:04Z | 2026-10-06T05:32:19Z | 1035 | wake | 0 | session-aa2b9a11-b980-4a29-b5ba-588ed299dd1c | ran: journal/wake/20261006T051504Z.log |
| 2026-10-06T11:15:05Z | 2026-10-06T11:32:20Z | 1035 | wake | 0 | session-7b67b773-6b15-4a8e-96d6-eded006c884d | ran: journal/wake/20261006T111505Z.log |
| 2026-10-06T17:15:05Z | 2026-10-06T17:33:22Z | 1097 | wake | 0 | session-a8ef4e48-7427-4646-9879-cef30d1dd5d0 | ran: journal/wake/20261006T171505Z.log |
| 2026-10-06T23:15:04Z | 2026-10-06T23:33:36Z | 1112 | wake | 0 | session-3da2b7ab-d42a-427b-bed7-7b53dba4ef1e | ran: journal/wake/20261006T231504Z.log |
| 2026-10-07T05:15:05Z | 2026-10-07T05:36:34Z | 1289 | wake | 0 | session-5d324707-2f3e-48bc-9d63-65862549a23b | ran: journal/wake/20261007T051505Z.log |
