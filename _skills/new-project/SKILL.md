---
name: new-project
description: ใช้เมื่อเริ่มโปรเจกต์ใหม่ หรือผูกโปรเจกต์ที่มีอยู่แล้ว (เช่น repo บริษัท/ทีม) เข้ากับ vault — สร้างโครงสร้างโปรเจกต์ใน Second Brain จาก _templates/ ลงทะเบียนใน index.md และสร้างไฟล์ pointer (AGENTS.md / CLAUDE.md / GEMINI.md) ใน workspace ในคำสั่งเดียว
---

# New Project

> **ภาษา:** ถาม ตอบ ตัวเลือก และ checklist ทั้งหมดเป็นภาษาไทย ตาม `AGENTS.md` หัวข้อ 0

Templates: `<vault>/_templates/`

1. ถามสั้นๆ ให้ได้ 4 อย่าง (ถ้าผู้ใช้ให้มาแล้วไม่ต้องถาม):
   - ชื่อโปรเจกต์ (ใช้เป็นชื่อโฟลเดอร์ใน vault)
   - Path ของ workspace repo (เช่น `D:\Workspace\my-app` หรือ `~/Projects/my-app`)
   - คำอธิบายระบบ / tech stack สั้นๆ และใช้ AI กี่ตัว (1 ตัว หรือ 2+ ตัว)
   - ประเภท repo: **ส่วนตัว** หรือ **ทีม** (มี `CLAUDE.md` ของทีมอยู่ใน git หรือไม่)

1.5 **ถ้า workspace มีโค้ดอยู่แล้ว (โปรเจกต์เดิม):** อ่านก่อนสร้างโครง ห้ามแก้ไฟล์ใดๆ ใน workspace ระหว่างอ่าน
   - `git branch --show-current`, `git log --oneline -15`, `git status`
   - README, ไฟล์ dependency (`package.json`, `go.mod`, `composer.json`, `pyproject.toml` ฯลฯ), โครงโฟลเดอร์ระดับบน, config lint/test/CI
   - เอาผลไปเติมในข้อ 2: tech stack + คำสั่ง dev/build/test ใน `index.md` และ `core/rules.md` (convention ที่เห็นจากโค้ดจริง ระบุว่า "ตรวจจากโค้ด"), branch ปัจจุบัน + งานล่าสุดจาก git log ใน `status.md`
   - สรุปสิ่งที่เข้าใจให้ผู้ใช้ตรวจ และถามกฎของทีมที่ดูจากโค้ดไม่ได้ (เช่น branch ไหนห้าม push ตรง, เปิด PR ไปที่ไหน) แล้วจดลง `core/rules.md`
   - ไม่บันทึก secret จาก `.env` หรือ config ลง vault

2. สร้างโครงใน `<vault>/<project>/` จาก `_templates/`:
   - `index.md` ← `_templates/project-index.md` (ระบุ path ของ workspace repo ด้วย)
   - `status.md` ← `_templates/status.md` (ใส่วันที่วันนี้ใน `อัปเดตล่าสุด: YYYY-MM-DD`)
   - `core/rules.md` ← `_templates/rules.md`
   - `log.md` ← `_templates/log.md`
   - สร้างโฟลเดอร์ `features/` และ `decisions/`
   - ลิงก์ภายในทุกอันใช้ wikilink path เต็มจาก root เช่น `[[<project>/status]]`

3. ลงทะเบียนโปรเจกต์ใน `<vault>/index.md` (หัวข้อ `Active Projects`)
   *(หมายเหตุ: `vault-check/check.js` จะ auto-detect โปรเจกต์ที่มี `status.md` ให้อัตโนมัติ)*

4. สร้างไฟล์ pointer ใน workspace `<workspace>/` (ห้ามเขียนกฎซ้ำใน workspace):
   - สร้าง `AGENTS.md` (และ `GEMINI.md` ด้วยถ้าใช้ Antigravity/Gemini):
     ```markdown
     # AGENTS.md — <project> workspace

     กฎและความรู้ทั้งหมดอยู่ใน Second Brain ไฟล์นี้เป็นแค่ทางเข้า ห้ามเขียนกฎซ้ำที่นี่

     อ่านตามลำดับก่อนเริ่มงานทุกครั้ง:
     1. `<VAULT_PATH>/AGENTS.md` — กฎกลาง + ลำดับการทำงาน
     2. `<VAULT_PATH>/_rules/fullstack-mentor.md` — กฎ Mentor (ถ้าเปิดใช้)
     3. `<VAULT_PATH>/<project>/status.md` — งานที่ค้าง
     4. `<VAULT_PATH>/<project>/core/rules.md` — กฎเฉพาะโปรเจกต์
     5. ถ้ามี `<VAULT_PATH>/<project>/handoff.md` ให้ทำต่อจากไฟล์นั้น

     ก่อนทำงาน: `git branch --show-current`
     จบงาน: skill `end-session` (หรือ `handoff` ถ้าจะสลับไป AI ตัวอื่น)
     ```
   - **ถ้าใช้ Claude Code + เป็น repo ส่วนตัว:** สร้าง `CLAUDE.md` เนื้อหา `@AGENTS.md`
   - **ถ้าใช้ Claude Code + เป็น repo ทีม:** ห้ามแก้ `CLAUDE.md` ของทีม ให้สร้าง `CLAUDE.local.md` เนื้อหา `@AGENTS.md` และเพิ่ม `AGENTS.md`, `GEMINI.md`, `CLAUDE.local.md` ลง `.git/info/exclude`
   - **repo ทีม/บริษัท:** ต้องไม่มีไฟล์ใหม่โผล่ใน `git status` หลังสร้าง pointer (ตรวจให้ผู้ใช้ดู)
   - *หมายเหตุ:* ถ้าไฟล์ pointer เดิมมีอยู่แล้ว ให้สำรองเป็น `*.bak-YYYYMMDD` ก่อนแทนที่

5. ปิดงาน:
   - เพิ่ม 1 บรรทัดใน `<vault>/log.md`
   - รัน `node <vault>/_skills/vault-check/check.js` ให้ได้ `issues: 0`
