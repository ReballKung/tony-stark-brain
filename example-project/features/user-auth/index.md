# ✨ User Authentication (ตัวอย่าง)

สถานะ: ออกแบบ · อัปเดต: 2026-11-25
Branch: `feature/user-auth` · repo ที่เกี่ยว: `example-app`

## สรุป (AI อ่านส่วนนี้ก่อน)
- เป้าหมาย: ตัวอย่างไฟล์ฟีเจอร์ใน Second Brain เพื่อให้เห็นรูปแบบการจด Requirement และแผนทีละขั้น
- Requirement ที่ยืนยันแล้ว: รองรับ login ด้วย email + password และออก JWT token
- คำถามที่ยังเปิด: อายุของ refresh token กี่วัน?

## แผนทีละขั้น
1. [ ] ออกแบบ schema ตาราง `users`
2. [ ] สร้าง endpoint `POST /auth/login`
3. [ ] เขียน unit test + integration test
