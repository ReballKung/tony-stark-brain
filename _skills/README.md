# 🧰 Skills Registry

ชุด Skill หลักที่มากับ Second Brain Template นี้ (รองรับทั้ง **AI 1 ตัว** และ **AI 2+ ตัวสลับกัน**)

## 1. Skills ใน Template นี้ (8 ตัว — พร้อมใช้ทันที)
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

---

## 2. 3rd-Party Skills แนะนำ (25 ตัว — ติดตั้งเพิ่มในคำสั่งเดียว)

ดึงจาก GitHub ต้นฉบับโดยตรง เพื่อให้ได้เวอร์ชันล่าสุด เคารพลิขสิทธิ์เจ้าของเดิม และไม่ทำให้ repo นี้บวม (~46 MB)

**สิ่งที่ต้องมีก่อนติดตั้ง:** Node.js 18+ (แนะนำ 22+) และ Git

| ชุด / แหล่งต้นฉบับ | Skills ที่ได้ | ใช้ทำอะไร | สิ่งที่ต้องมีเพิ่มเติม |
|---|---|---|---|
| `mattpocock/skills` | `grill-me`, `grilling` | ซักแผนงานทีละรอบจนเข้าใจตรงกัน | - |
| `obra/superpowers` | `brainstorming`, `writing-plans`, `executing-plans`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`, `finishing-a-development-branch`, `using-git-worktrees`, `subagent-driven-development`, `dispatching-parallel-agents`, `using-superpowers`, `writing-skills`, `diagnosing-superpowers` | วางแผน → ทำตามแผน → TDD → Debug อย่างเป็นระบบ → Review & ปิด branch | - |
| `nextlevelbuilder/ui-ux-pro-max-skill` | `ui-ux-pro-max`, `ui-styling`, `design-system`, `design`, `brand`, `banner-design`, `slides` | ออกแบบ/รีวิว UI, shadcn+Tailwind, design tokens, แบรนด์, แบนเนอร์, สไลด์ HTML | Python 3 (สำหรับบางสคริปต์) |
| `Leonxlnx/taste-skill` | `design-taste-frontend` | สร้าง landing page / เว็บบริษัทคุณภาพสูงพร้อมตรวจ layout อัตโนมัติ | Node.js 22+ และ Chrome/Edge *(มี Stop hook ทำงานเฉพาะโปรเจกต์ที่มี `.taste-skill/build.json`)* |

### วิธีติดตั้งครบทั้ง 4 ชุดในคำสั่งเดียว
- **Windows (PowerShell):**
  ```powershell
  powershell -ExecutionPolicy Bypass -File _skills/install-recommended.ps1
  ```
- **macOS / Linux:**
  ```bash
  bash _skills/install-recommended.sh
  ```

> ⚠️ **ชนกับ Mentor Mode:** หากคุณเปิดใช้ Mentor Mode ใน `AGENTS.md` หัวข้อ 2 ไว้ skill ที่เขียนโค้ดเองได้ (`executing-plans`, `test-driven-development`, `subagent-driven-development`) จะยังต้องเคารพกฎคือไม่แก้โค้ดใน repo งานจนกว่าคุณจะสั่ง implement
