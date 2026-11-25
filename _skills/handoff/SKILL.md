---
name: handoff
description: ส่งไม้ต่องานระหว่าง AI (เช่น Claude Code ↔ Antigravity ↔ Cursor ↔ Codex) เมื่อ token/usage ใกล้หมดหรือจบ session กลางงาน หรือรับไม้ต่อเมื่อผู้ใช้พิมพ์ "ทำต่อจาก handoff"
---

# Handoff — ส่งไม้ / รับไม้ต่อระหว่าง AI

> **ภาษา:** ถาม ตอบ ตัวเลือก และ checklist ทั้งหมดเป็นภาษาไทย ตาม `AGENTS.md` หัวข้อ 0

Template: `<vault>/_templates/handoff.md`

## โหมด A: ส่งไม้ (ผู้ใช้พิมพ์ `/handoff`, "ส่งไม้ต่อ", หรือ usage ใกล้หมด)

1. ระบุโปรเจกต์จาก workspace ที่เปิดอยู่ ถ้าไม่แน่ใจถาม 1 คำถาม
2. ตรวจของจริงก่อนเขียน: `git status` และ `git branch --show-current` ในทุก repo ที่แตะ ห้ามเขียนจากความจำ
3. เขียน `<vault>/<project>/handoff.md` ตาม template ให้ครบ 6 ส่วน:
   - ข้อ 3 ระบุให้ชัดว่าไฟล์ไหน "แก้แล้วในเครื่อง", "ยังไม่ commit", หรือ "แค่เสนอ Before/After ผู้ใช้ยังไม่ใส่"
   - ข้อ 4 เขียนขั้นตอนถัดไปให้ AI อีกตัวทำต่อได้ทันทีโดยไม่ต้องถามซ้ำ
4. อัปเดต `<vault>/<project>/status.md` และเพิ่ม 1 บรรทัดท้าย `<vault>/<project>/log.md`:
   `- YYYY-MM-DD [<AI ต้นทาง>→<AI ปลายทาง>] handoff: <งาน>`
5. ตอบผู้ใช้ด้วย 2 อย่าง:
   - สรุป 2 บรรทัดว่าค้างอะไร
   - **ประโยคพร้อม copy** ไปวางใน AI อีกตัว:
     ```text
     อ่าน <VAULT_PATH>/AGENTS.md แล้วทำต่อจาก <VAULT_PATH>/<project>/handoff.md
     ```

## โหมด B: รับไม้ (ผู้ใช้พิมพ์ "ทำต่อจาก handoff" หรือประโยคด้านบน)

1. อ่าน `<vault>/AGENTS.md` → `<vault>/<project>/handoff.md` → `<vault>/<project>/status.md`
2. ตรวจ `git status` เทียบกับข้อ 3 ใน `handoff.md` ถ้าไม่ตรง ให้บอกผู้ใช้ก่อนทำต่อ
3. สรุปกลับ 3 บรรทัด: เข้าใจว่างานคืออะไร, ทำถึงไหน, จะทำข้อไหนต่อ แล้วรอผู้ใช้ยืนยันก่อนลงมือ
4. เมื่องานจบ แทนเนื้อหา `handoff.md` ด้วย `(ไม่มีงานค้าง — ปิดเมื่อ YYYY-MM-DD)` และอัปเดต `status.md` + `log.md`
