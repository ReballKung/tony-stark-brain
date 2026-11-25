# 🦾 Tony Stark Brain (`tony-stark-brain`)

> **J.A.R.V.I.S. สำหรับสาย Dev** — ระบบ **Second Brain (External Memory)** สำหรับทำงานกับ AI Coding Assistant (**Claude Code, Antigravity, Cursor, Codex, Gemini CLI** หรือตัวไหนก็ได้)

เทียบง่ายๆ แบบ Iron Man:
- **AI แต่ละตัว** = ชุดเกราะแต่ละ Mark (สลับใช้ตามงานหรือตอน token หมด)
- **Tony Stark Brain (Vault นี้)** = **ตัว J.A.R.V.I.S. เอง** — สมองกลางที่จำทุกโปรเจกต์ รู้กฎเหล็ก เช็กสถานะ และคอยบรีฟคุณตอนเปิดคอม รองรับทั้งคนที่ใช้ **AI 1 ตัว** หรือ **สลับใช้ AI 2+ ตัว**

---

## ทำไมต้องใช้ Second Brain?

- **AI ไม่ลืมงานข้ามแชท:** ความจำทั้งหมดเก็บเป็นไฟล์ Markdown ธรรมดา (`status.md`, `core/`, `features/`, `log.md`) ในเครื่องของคุณเอง (เปิดดูสวยๆ ด้วย [Obsidian](https://obsidian.md/) ได้)
- **กฎกลางไฟล์เดียว (`AGENTS.md`):** ไม่ต้องเขียนกฎซ้ำในหลายโปรแกรม ทุก AI อ่านจากแหล่งเดียวกัน
- **สลับ AI กลางงานได้ไม่สะดุด:** เมื่อ token/usage ของ AI ตัวแรกหมด สั่ง `handoff` แล้วไปทำต่อใน AI ตัวที่สองได้ทันที
- **มีตัวตรวจสุขภาพอัตโนมัติ (`vault-check`):** เช็กลิงก์เสีย, `status.md` เก่าเกิน 7 วัน, `handoff.md` ค้าง และไฟล์ที่ยาวเกินไปได้ด้วยคำสั่งเดียว

---

## 📋 สิ่งที่ต้องมีก่อนเริ่ม (Prerequisites)

| เครื่องมือ | จำเป็นไหม | ใช้ทำอะไร |
|---|---|---|
| **Git** | จำเป็น | Clone/backup vault และให้ AI ตรวจ `git status` / `git branch` |
| **AI Coding Assistant อย่างน้อย 1 ตัว** | จำเป็น | เช่น Claude Code, Antigravity, Cursor, Codex หรือ Gemini CLI (ใช้ 1 ตัว หรือ 2+ ตัวก็ได้) |
| **Node.js 18+** (แนะนำ **22+**) | แนะนำ | ใช้รัน `vault-check` และติดตั้ง 3rd-Party Skills ด้วย `npx skills add` |
| **[Obsidian](https://obsidian.md/)** | ไม่บังคับ (แนะนำ) | เปิดอ่าน vault สวยๆ คลิก wikilink ข้ามไฟล์ และดู Graph View |
| **Python 3 / Chrome หรือ Edge** | เฉพาะบาง 3rd-Party Skill | Python สำหรับบางสคริปต์ใน `ui-ux-pro-max` · Node 22+ และ Chrome/Edge สำหรับ `design-taste-frontend` |

---

## 🚀 เริ่มใช้งานใน 5 นาที

### ขั้นที่ 1: สร้าง Vault ของตัวเอง
1. กดปุ่ม **"Use this template"** ด้านบนขวาของ [ReballKung/tony-stark-brain](https://github.com/ReballKung/tony-stark-brain) → เลือก **"Create a new repository"**
2. ตั้งชื่อ repo ของคุณ (เช่น `my-tony-stark-brain`) และแนะนำให้เลือกเป็น **Private** (เพราะต่อไปคุณจะเก็บข้อมูลโปรเจกต์จริงไว้ในนี้)
3. Clone ลงเครื่องของคุณ เช่น:
   ```bash
   git clone https://github.com/<your-username>/my-tony-stark-brain.git
   ```

### ขั้นที่ 2: ติดตั้ง Skills ให้ AI รู้จัก (เลือกตามระบบปฏิบัติการ)

#### Windows (PowerShell — ไม่ต้องเปิดเป็น Admin)
```powershell
# เปลี่ยน path เป็นที่ที่คุณ clone vault ไว้
$src = "D:\Workspace\my-second-brain\_skills"

# เชื่อมให้ทั้ง Claude Code และ Antigravity (ถ้าใช้แค่ตัวเดียว ระบบจะสร้างเฉพาะโฟลเดอร์ที่มีอยู่)
$targets = @(
  "$env:USERPROFILE\.claude\skills",
  "$env:USERPROFILE\.gemini\config\skills"
)

Get-ChildItem $src -Directory | ForEach-Object {
  foreach ($t in $targets) {
    if (Test-Path $t) {
      $dst = Join-Path $t $_.Name
      if (-not (Test-Path $dst)) {
        New-Item -ItemType Junction -Path $dst -Target $_.FullName | Out-Null
        "linked $dst"
      }
    }
  }
}
```

#### macOS / Linux (Bash / Zsh)
```bash
# เปลี่ยน path เป็นที่ที่คุณ clone vault ไว้
SRC="$HOME/Workspace/my-second-brain/_skills"

for target in "$HOME/.claude/skills" "$HOME/.gemini/config/skills"; do
  if [ -d "$target" ]; then
    for dir in "$SRC"/*/; do
      name=$(basename "$dir")
      [ -e "$target/$name" ] || ln -s "$dir" "$target/$name"
    done
  fi
done
```

> **ใช้ Cursor / Codex / AI ตัวอื่นที่ไม่ได้อ่านโฟลเดอร์ skills?**
> ไม่เป็นไรครับ! แค่บอกในไฟล์กฎของโปรเจกต์ (`AGENTS.md`, `.cursorrules`, `CLAUDE.md`) ให้ AI อ่าน `<VAULT_PATH>/AGENTS.md` เป็นลำดับแรก ระบบก็ทำงานได้เหมือนกันทั้งหมด

### ขั้นที่ 3 (Optional): ติดตั้ง 3rd-Party Skills แนะนำอีก 25 ตัวในคำสั่งเดียว
ถ้าอยากได้ชุด skill เสริมด้านวางแผน, TDD, Debugging, Code Review และออกแบบ UI/Landing Page (ดึงจาก GitHub ต้นฉบับโดยตรง — ต้องมี **Node.js 18+**):

- **Windows (PowerShell):**
  ```powershell
  powershell -ExecutionPolicy Bypass -File _skills/install-recommended.ps1
  ```
- **macOS / Linux:**
  ```bash
  bash _skills/install-recommended.sh
  ```

ดูรายละเอียด skill ทั้งหมดในชุดนี้ได้ที่ [_skills/README.md](_skills/README.md)

---

## 🎯 เลือกรูปแบบการใช้งาน (1 AI vs 2+ AI)

### แบบที่ 1: ใช้ AI แค่ 1 ตัว (เช่น Claude Code หรือ Antigravity หรือ Cursor ตัวเดียว)
ลูปการทำงานต่อวันมีแค่ 3 ขั้นตอน:
1. **เริ่มวัน:** พิมพ์ `"เริ่มงาน"` (หรือ `/start-session`) → AI อ่าน `status.md` + เช็ก `git status` แล้วสรุปว่าค้างอะไร
2. **ระหว่างทำงาน:** ทำงานปกติ หรือสั่ง `/new-feature` เมื่อได้งานใหม่
3. **จบวัน:** พิมพ์ `"จบงาน"` (หรือ `/end-session`) → AI อัปเดต `status.md` + เพิ่ม 1 บรรทัดใน `log.md`

*(ไม่ต้องใช้ `handoff`)*

### แบบที่ 2: ใช้ AI 2 ตัวขึ้นไปสลับกัน (เช่น Claude Code ↔ Antigravity)
ใช้ลูปเดียวกับแบบที่ 1 และเพิ่มขั้นตอน **ส่งไม้ต่อ** เมื่อสลับเครื่องมือหรือ usage ใกล้หมด:
1. **ฝั่ง AI ตัวที่ 1:** พิมพ์ `/handoff` หรือ `"ส่งไม้ต่อ"` → AI จะสรุปงานค้างลง `<project>/handoff.md` และให้ประโยคพร้อม copy
2. **ฝั่ง AI ตัวที่ 2:** วางประโยคที่ copy มา → AI อ่าน `handoff.md` แล้วทำต่อจากจุดเดิมทันที
3. **เมื่องานจบ:** AI จะปิด `handoff.md` และอัปเดต `status.md` + `log.md` ให้เอง

---

## 💬 ตัวอย่างคำสั่งที่ใช้คุยกับ AI ในชีวิตประจำวัน

| สถานการณ์ | พิมพ์บอก AI | Skill ที่ทำงาน |
|---|---|---|
| เริ่มโปรเจกต์ใหม่ | `"สร้างโปรเจกต์ใหม่ชื่อ my-shop อยู่ที่ D:\Workspace\my-shop"` | `new-project` |
| เริ่มทำงานแต่ละวัน | `"เริ่มงาน"` หรือ `/start-session` | `start-session` |
| ได้ฟีเจอร์ / Requirement ใหม่ | `"สร้างฟีเจอร์ใหม่ coupon-system"` หรือ `/new-feature` | `new-feature` |
| อยากให้ AI ซักแผนทีละข้อแบบมีตัวเลือก | `/grill-choice` | `grill-choice` |
| อยากฝึกเขียนโค้ดเอง (AI สอน + ให้ diff) | ถามได้เลย (Mentor Mode เปิดเป็นค่าเริ่มต้น) | `mentor-mode` |
| อยากให้ AI แก้โค้ดให้เลย | `"แก้เลย"` / `"implement"` | - |
| สลับไปใช้ AI อีกตัวกลางงาน | `"ส่งไม้ต่อ"` หรือ `/handoff` | `handoff` |
| จบวัน / ปิดงาน | `"จบงาน"` หรือ `/end-session` | `end-session` |

---

## ⚙️ การปรับแต่ง (Optional)

- **ไม่อยากใช้ Mentor Mode (อยากให้ AI แก้โค้ดให้เลยเป็นค่าเริ่มต้น)?**
  เปิด [AGENTS.md](AGENTS.md) หัวข้อ 2 แล้วเปลี่ยนค่าเริ่มต้น หรือลบเงื่อนไข Mentor Mode ออกได้เลย
- **ตรวจสุขภาพ Vault (ต้องมี Node.js 18+):**
  ```bash
  node _skills/vault-check/check.js
  ```
  ระบบจะตรวจหาลิงก์เสีย, `status.md` ที่ไม่ได้อัปเดตเกิน 7 วัน, `handoff.md` ที่ยังค้าง และไฟล์ฟีเจอร์ที่ยาวเกิน 15 KB โดย **auto-detect ทุกโปรเจกต์ที่มี `status.md`** อัตโนมัติ

---

## 📂 โครงสร้างโฟลเดอร์

```text
second-brain/
├── AGENTS.md                 # กฎกลางไฟล์เดียวสำหรับ AI ทุกตัว
├── index.md                  # สารบัญโปรเจกต์ทั้งหมด
├── log.md                    # ประวัติการเปลี่ยนแปลงระดับ vault
├── _rules/
│   └── fullstack-mentor.md   # กฎ 47 ข้อ (Senior FullStack Mentor)
├── _templates/               # แม่แบบสร้างโปรเจกต์, status, feature, ADR, handoff
├── _skills/                  # ชุด 8 skills พร้อมใช้ + รายชื่อ 3rd-party skills แนะนำ
└── example-project/          # โปรเจกต์ตัวอย่าง (ลบออกได้เมื่อสร้างโปรเจกต์จริงแล้ว)
```
