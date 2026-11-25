# 🧰 Skills Registry

ชุด Skill หลักที่มากับ Second Brain Template นี้ (รองรับทั้ง **AI 1 ตัว** และ **AI 2+ ตัวสลับกัน**)

## Skills ใน Template นี้ (8 ตัว)
| Skill | ใช้ทำอะไร | ใช้ได้กับ AI 1 ตัว | ใช้กับ AI 2+ ตัว |
|---|---|---|---|
| [start-session](start-session/SKILL.md) | เริ่มงาน: อ่าน `AGENTS.md` + `status.md` + `rules.md` + เทียบ `git status` | ✅ | ✅ |
| [end-session](end-session/SKILL.md) | จบวัน: อัปเดต `status.md` + เพิ่ม 1 บรรทัดใน `log.md` | ✅ | ✅ |
| [new-project](new-project/SKILL.md) | สร้างโครงโปรเจกต์ใหม่ใน vault + ไฟล์ pointer ใน workspace ในคำสั่งเดียว | ✅ | ✅ |
| [new-feature](new-feature/SKILL.md) | สร้างไฟล์ฟีเจอร์จาก template + วางแผนทีละขั้น | ✅ | ✅ |
| [mentor-mode](mentor-mode/SKILL.md) | เสนอการแก้โค้ดแบบ Before / After(diff) / After(อธิบาย) / After(copy) ไม่แก้เอง | ✅ | ✅ |
| [handoff](handoff/SKILL.md) | ส่ง/รับไม้ต่องานข้าม AI เมื่อสลับโปรแกรมหรือ token ใกล้หมด | ไม่จำเป็น | ✅ |
| [grill-choice](grill-choice/SKILL.md) | ซักแผนงานทีละข้อแบบมีตัวเลือกจนเข้าใจตรงกัน | ✅ | ✅ |
| [vault-check](vault-check/check.js) | สคริปต์ Node ตรวจสุขภาพ vault (ลิงก์เสีย, status เก่าเกิน 7 วัน, handoff ค้าง, ไฟล์ยาว) | ✅ | ✅ |

## 3rd-Party Skills แนะนำ (Optional — ติดตั้งแยกจากต้นฉบับ)
- **superpowers** (brainstorming, writing-plans, systematic-debugging, TDD, code review) — ค้นหา `obra/superpowers`
- **mattpocock/skills** (`grill-me`, `grilling`) — ซักแผนงานทีละรอบ
- **ui-ux-pro-max-skill** — ออกแบบ/รีวิว UI, design system, Tailwind

> วิธีติดตั้ง skill ลงเครื่อง (Windows PowerShell และ macOS/Linux) ดูได้ที่ [README.md](../README.md)
