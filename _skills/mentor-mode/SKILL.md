---
name: mentor-mode
description: ใช้เมื่อผู้ใช้รายงานบั๊ก ถามสาเหตุ ขอแนวทาง หรือขอ Step by Step ในโค้ดของ repo งาน — เสนอการแก้แบบ Before / After(diff) / After(อธิบาย) / After(copy) ให้ผู้ใช้พิมพ์เองและเรียนรู้ไปด้วย โดยไม่แก้ไฟล์เอง
---

# Mentor Mode

> **ภาษา:** ถาม ตอบ ตัวเลือก และ checklist ทั้งหมดเป็นภาษาไทย ตาม `AGENTS.md` หัวข้อ 0

กฎเต็มอยู่ที่ `<vault>/AGENTS.md` หัวข้อ 2-3 อ่านก่อนเสมอ

## ขั้นตอน
1. **ห้ามแก้ไฟล์โค้ด** จนกว่าผู้ใช้สั่ง implement ชัดเจน ("แก้เลย", "implement")
2. **ตรวจของจริง:** `git branch --show-current`, `git status` และเปิดไฟล์จริงที่เกี่ยวข้อง อ่าน `<vault>/<project>/core/rules.md`
3. **ทำความเข้าใจ flow:** route → controller → service/model → DB และฝั่ง frontend → API ที่เรียก บอกผู้ใช้ว่าตรวจไฟล์ไหนบ้าง
4. **เขียนคำตอบตามรูปแบบ:**
   1. ปัญหาที่พบ (สาเหตุ, ผลกระทบ, ทำไมต้องแก้) แยก "ตรวจแล้ว" กับ "สมมติฐาน"
   2. ทุก Change: path + บรรทัด แล้ว 4 ส่วน:
      - Before (คัดจากไฟล์จริง)
      - After (diff) ```` ```diff ```` (`+` เพิ่ม, `-` ลบ)
      - After (อธิบาย) comment `[เรียนรู้]` / `[ระวัง]` + สรุป input → process → output
      - After (copy) โค้ดสะอาด วางแทนได้ทันที
   3. สิ่งที่เปลี่ยน + ผลกระทบ + trade-off (ถ้ามีหลายทางให้ Option A/B พร้อมคำแนะนำ)
   4. วิธีแก้ด้วยตัวเอง step by step + คำสั่งตรวจสอบ (typecheck, test, build)
5. **Checklist ก่อนส่ง:** convention ของ repo, security (auth/RBAC/IDOR/validation), transaction/race condition, type consistency
6. ผู้ใช้แก้แล้วส่งกลับ → review ตามจริง ชมจุดที่ถูก ชี้จุดที่ต้องแก้พร้อมเหตุผล

## ห้าม
- ห้ามใช้ `...` ซ่อนโค้ด ห้ามตอบ "แก้ประมาณนี้"
- ห้ามสร้าง Before จากความจำ ถ้าเปิดไฟล์ไม่ได้ให้บอกว่าขาดอะไร
