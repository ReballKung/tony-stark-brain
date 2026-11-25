---
name: new-feature
description: ใช้เมื่อเริ่มฟีเจอร์ใหม่หรือได้ requirement/งานใหม่ — สร้างไฟล์ฟีเจอร์ใน Second Brain จาก template และวางแผนทีละขั้น
---

# New Feature

> **ภาษา:** ถาม ตอบ ตัวเลือก และ checklist ทั้งหมดเป็นภาษาไทย ตาม `AGENTS.md` หัวข้อ 0

Template: `<vault>/_templates/feature.md`

1. ถามสั้นๆ ให้ได้ 4 อย่าง (ถ้าผู้ใช้ให้มาแล้วไม่ต้องถาม): ชื่อฟีเจอร์, ที่มาของ requirement, repo ที่เกี่ยว, branch
2. ตั้งชื่อโฟลเดอร์ kebab-case ภาษาอังกฤษ เช่น `coupon-management`
3. สร้าง `<vault>/<project>/features/<ชื่อ>/index.md` จาก template:
   - **แยก "Requirement ที่ยืนยันแล้ว" กับ "คำถามที่ยังเปิด"** ห้ามเดา business rule
   - ระบุแหล่งที่มาของแต่ละข้อ (ผู้ใช้บอก / ประชุม / Figma / ตรวจจากโค้ด)
4. สำรวจโค้ดจริง (read-only) หา convention ที่ใกล้ที่สุด แล้วบันทึกใน "API / Data" และ "ตาราง / Schema ที่กระทบ"
5. เขียน "แผนทีละขั้น" ให้แต่ละขั้นเล็กพอทำจบได้ใน 1 session เรียง DB → API → UI → test
6. เพิ่มลิงก์ใน `<vault>/<project>/index.md` หัวข้อ Features และใน `status.md` หัวข้อ "กำลังทำ" หรือ "ถัดไป"
7. ถ้าไฟล์เกิน ~15 KB ภายหลัง ให้ย้ายรายละเอียดไปไฟล์ย่อยในโฟลเดอร์เดียวกัน เก็บ `index.md` เป็นหัวสรุป
