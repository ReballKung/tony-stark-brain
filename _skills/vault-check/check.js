#!/usr/bin/env node
// [เรียนรู้] ตรวจสุขภาพ Second Brain แล้วพิมพ์ผลเป็น JSON 1 ก้อน (อ่านอย่างเดียว ไม่แก้ไฟล์ใดๆ)
// ใช้: node _skills/vault-check/check.js [path ของ vault]  (ค่าเริ่มต้น = โฟลเดอร์แม่ของ _skills)
const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(process.argv[2] || path.join(__dirname, '..', '..'));
const SKIP = new Set(['.obsidian', '_archive', '_skills', '_templates', '_rules', 'node_modules', '.git']);
const STALE_DAYS = 7;
const MAX_FEATURE_KB = 15;
const MAX_STATUS_KB = 5;

// [เรียนรู้] Auto-detect โปรเจกต์ทั้งหมดจากโฟลเดอร์ชั้นแรกที่มี status.md (ไม่ต้อง hardcode ชื่อโปรเจกต์)
function detectProjects(root) {
  return fs.readdirSync(root, { withFileTypes: true })
    .filter((e) => e.isDirectory() && !SKIP.has(e.name) && !e.name.startsWith('_backup') && !e.name.startsWith('.'))
    .map((e) => e.name)
    .filter((name) => fs.existsSync(path.join(root, name, 'status.md')));
}

// [เรียนรู้] เดินทุกโฟลเดอร์แบบ recursive เก็บเฉพาะ .md (ข้าม _backup-* และโฟลเดอร์ระบบ)
function walk(dir, out = []) {
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    if (SKIP.has(e.name) || e.name.startsWith('_backup')) continue;
    const p = path.join(dir, e.name);
    if (e.isDirectory()) walk(p, out);
    else if (e.name.endsWith('.md')) out.push(p);
  }
  return out;
}

const PROJECTS = detectProjects(ROOT);
const files = walk(ROOT);
const rel = (p) => path.relative(ROOT, p).split(path.sep).join('/');
const byBase = {};
for (const f of files) (byBase[path.basename(f, '.md')] ??= []).push(rel(f));

// 1) ลิงก์เสีย: [[target]] ต้องเป็น path เต็มจาก root หรือชื่อไฟล์ที่ไม่ซ้ำ
const brokenLinks = [];
for (const f of files) {
  const text = fs.readFileSync(f, 'utf8').replace(/`[^`\n]*`/g, '');
  for (const m of text.matchAll(/\[\[([^\]|#]+)[^\]]*\]\]/g)) {
    const t = m[1].trim();
    const here = path.dirname(f);
    const ok = fs.existsSync(path.join(ROOT, t + '.md')) || fs.existsSync(path.join(ROOT, t)) ||
      fs.existsSync(path.join(here, t + '.md')) ||
      (byBase[path.basename(t)] || []).length === 1;
    if (!ok) brokenLinks.push({ file: rel(f), link: t });
  }
}

// 2) status.md เก่าเกิน 7 วัน หรือยาวเกิน 5 KB + ตรวจ handoff.md ค้าง
const today = new Date();
const staleStatus = [];
const openHandoffs = [];
for (const p of PROJECTS) {
  const sp = path.join(ROOT, p, 'status.md');
  const s = fs.readFileSync(sp, 'utf8');
  const m = s.match(/อัปเดตล่าสุด:\s*(\d{4}-\d{2}-\d{2})/);
  const days = m ? Math.floor((today - new Date(m[1] + 'T00:00:00')) / 86400000) : null;
  if (days === null || days > STALE_DAYS) staleStatus.push({ project: p, lastUpdated: m ? m[1] : null, days });
  if (Buffer.byteLength(s) > MAX_STATUS_KB * 1024) staleStatus.push({ project: p, reason: `status.md ยาว ${Math.round(Buffer.byteLength(s) / 1024)} KB` });
  const hp = path.join(ROOT, p, 'handoff.md');
  if (fs.existsSync(hp) && !/ไม่มีงานค้าง/.test(fs.readFileSync(hp, 'utf8'))) openHandoffs.push(p);
}

// 3) หัวสรุปฟีเจอร์ยาวเกิน 15 KB
const bigFiles = files
  .filter((f) => /\/features\/[^/]+(\/index)?\.md$/.test(rel(f)) || /\/features\/[^/]+\.md$/.test(rel(f)))
  .map((f) => ({ file: rel(f), kb: Math.round(fs.statSync(f).size / 1024) }))
  .filter((x) => x.kb > MAX_FEATURE_KB);

const issues = brokenLinks.length + staleStatus.length + bigFiles.length + openHandoffs.length;
console.log(JSON.stringify({ checkedAt: today.toISOString().slice(0, 10), projects: PROJECTS, files: files.length, issues, brokenLinks, staleStatus, bigFiles, openHandoffs }, null, 2));
