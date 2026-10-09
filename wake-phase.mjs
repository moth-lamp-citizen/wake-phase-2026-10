// Wake-interval phase/correlation statistics from journal/wake/INDEX.md.
// READ-ONLY. v2 (2026-10-09): a "wake" row is an execution only when its recorded seconds > 0. The
// v1 filter took every mode == "wake" row, which counted two 2026-09-26 rows that are skips
// (0 seconds, exit "-", "skipped: recent operator activity") as wakes; v1 reported 51 wakes /
// 50 intervals / 47 clean for the 2026-09-23T17:15:04Z..2026-10-07T05:15:05Z window and the
// corrected count is 49 / 48 / 43. Skipped slots are not executions, and splitting a two-slot outage
// into two near-grid intervals is exactly what the filter exists to prevent.
// A "clean" interval is one within 600 s of 21,600 s (the scheduled period, bin/WAKE.md: launchd
// StartCalendarInterval at 00:15/06:15/12:15/18:15 local). The corrected window's excluded intervals
// are 43,195 s and 43,202 s (2026-09-26, two consecutive skips then the guard's false-skip pair),
// 64,799 s (3 periods - 1 s), 67,405 s (3 periods + 2,605 s) and 18,997 s (1 period - 2,603 s).
import fs from "node:fs";
const idxPath = process.argv[2] || "journal/wake/INDEX.md";
const lines = fs.readFileSync(idxPath, "utf8").split("\n").filter(l => l.startsWith("| 20"));
const rows = lines.map(l => l.split("|").map(s => s.trim())).map(p => ({ start: Date.parse(p[1]), end: Date.parse(p[2]), mode: p[4], exit: p[5], raw: p[1] }));
const wakes = rows.filter(r => r.mode === "wake" && r.exit !== "-").map(r => r.start).sort((a, b) => a - b);
console.log("skipped rows excluded:", rows.filter(r => r.mode === "wake" && r.exit === "-").length);
console.log("wake rows:", wakes.length, "first:", new Date(wakes[0]).toISOString(), "last:", new Date(wakes[wakes.length - 1]).toISOString());
const iv = [], keep = [];
for (let i = 1; i < wakes.length; i++) { const d = (wakes[i] - wakes[i - 1]) / 1000; iv.push(d); keep.push(Math.abs(d - 21600) < 600); }
const clean = iv.filter((d, i) => keep[i]);
const mean = clean.reduce((a, b) => a + b, 0) / clean.length;
const sd = Math.sqrt(clean.reduce((a, b) => a + (b - mean) ** 2, 0) / (clean.length - 1));
console.log("intervals:", iv.length, "clean:", clean.length, "excluded:", iv.length - clean.length);
console.log("excluded values (s):", iv.filter((d, i) => !keep[i]).map(d => d.toFixed(1)).join(", "));
console.log("clean mean (s):", mean.toFixed(6), "sd:", sd.toFixed(6), "min:", Math.min(...clean).toFixed(1), "max:", Math.max(...clean).toFixed(1));
const pairs = [];
for (let i = 0; i < iv.length - 1; i++) if (keep[i] && keep[i + 1]) pairs.push([iv[i], iv[i + 1]]);
const m1 = pairs.reduce((a, p) => a + p[0], 0) / pairs.length, m2 = pairs.reduce((a, p) => a + p[1], 0) / pairs.length;
let num = 0, d1 = 0, d2 = 0;
for (const [a, b] of pairs) { num += (a - m1) * (b - m2); d1 += (a - m1) ** 2; d2 += (b - m2) ** 2; }
const rho = num / Math.sqrt(d1 * d2);
console.log("lag-1 pairs:", pairs.length, "rho:", rho.toFixed(6), "approx SE:", (1 / Math.sqrt(pairs.length)).toFixed(4));
const ref = wakes[0], ph = [];
for (let i = 0; i < wakes.length; i++) {
  if (i > 0 && !keep[i - 1]) { ph.push(null); continue; }
  let p = ((wakes[i] - ref) % 21600000 + 21600000) % 21600000 / 1000;
  ph.push(p > 10800 ? p - 21600 : p);
}
const good = ph.filter(x => x !== null);
const pm = good.reduce((a, b) => a + b, 0) / good.length;
const psd = Math.sqrt(good.reduce((a, b) => a + (b - pm) ** 2, 0) / (good.length - 1));
console.log("phase rows:", good.length, "mean (s):", pm.toFixed(6), "sd (s):", psd.toFixed(6), "range:", Math.min(...good).toFixed(1), "to", Math.max(...good).toFixed(1));
console.log("nulls (wake follows an excluded interval):", ph.filter(x => x === null).length);