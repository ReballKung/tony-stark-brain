---
name: start-session
description: ใช้ตอนเริ่มงานใหม่ หรือเมื่อผู้ใช้พิมพ์ "เริ่มงาน", "start", "วันนี้ทำอะไรต่อ" — โหลดกฎและสถานะจาก Second Brain และเทียบกับ git จริงก่อนลงมือ
---

# Start Session

1. หาตำแหน่ง Second Brain vault (จาก `AGENTS.md` / `CLAUDE.md` / `GEMINI.md` ใน workspace ปัจจุบัน) และระบุชื่อโปรเจกต์จาก repo ที่เปิดอยู่ ถ้าไม่แน่ใจให้ถาม 1 คำถาม
2. อ่านตามลำดับ (อ่านเท่านี้ก่อน ไม่ต้องเปิดไฟล์อื่น):
   1. `<vault>/AGENTS.md`
   2. `<vault>/<project>/status.md`
   3. `<vault>/<project>/core/rules.md`
   4. `<vault>/<project>/handoff.md` — ถ้ามีและไม่ได้ปิดงานแล้ว → ใช้ skill `handoff` โหมดรับไม้แทน
3. ตรวจของจริง: `git branch --show-current` และ `git status --short` ใน repo ของโปรเจกต์ เทียบกับ `status.md`
4. ตอบผู้ใช้ไม่เกิน 6 บรรทัด:
   - งานที่ค้าง (จาก `status.md`) และ branch ปัจจุบัน
   - ⚠️ สิ่งที่ไม่ตรงกัน เช่น branch ต่างจาก status, มีไฟล์แก้ค้างที่ status ไม่ได้บอก, status อัปเดตเกิน 7 วัน
   - ถามว่า "วันนี้จะทำข้อไหน" พร้อมเสนอข้อที่แนะนำ
5. ถ้า `status.md` ไม่ตรงกับความจริงใน git ให้แก้ `status.md` ทันทีแล้วแจ้งผู้ใช้
