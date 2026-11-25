# 🦾 Tony Stark Brain (`tony-stark-brain`)

**ระบบ Second Brain (External Memory) สำหรับการทำงานร่วมกับ AI Coding Assistant**  
รองรับการใช้งานได้ทั้ง **AI 1 ตัว** และ **AI 2 ตัวขึ้นไปสลับกัน** (Claude Code, Antigravity, Cursor, Codex, Gemini CLI และเครื่องมืออื่นๆ)

> **แนวคิดหลัก:** แยก "ความจำและกฎของโปรเจกต์" ออกมาเก็บไว้ในคลัง Markdown กลาง (Vault) เพื่อให้ AI ทุกตัวอ่านบริบทล่าสุดได้ทันทีเมื่อเปิดแชทใหม่ โดยไม่ต้องอธิบายโครงสร้างหรือสถานะงานซ้ำตั้งแต่ต้น

---

## จุดเด่นของระบบ

- **ความจำถาวรข้ามแชท:** เก็บสถานะงาน (`status.md`), กฎเฉพาะโปรเจกต์ (`core/rules.md`), แผนฟีเจอร์ (`features/`) และประวัติงาน (`log.md`) ไว้ในเครื่องของคุณเอง
- **กฎกลางไฟล์เดียว (`AGENTS.md`):** ไม่ต้องเขียนกฎซ้ำหลายโปรแกรม ทุก AI อ่านจากแหล่งข้อมูลเดียวกัน
- **รองรับการส่งไม้ต่อข้าม AI (`handoff`):** เมื่อโควต้า/token ของ AI ตัวแรกหมด สามารถสรุปสถานะและส่งต่อให้ AI อีกตัวทำต่อได้ทันที
- **ตรวจสุขภาพ Vault อัตโนมัติ (`vault-check`):** ตรวจสอบลิงก์เสีย, `status.md` ที่ไม่ได้อัปเดตเกิน 7 วัน, `handoff.md` ค้าง และขนาดไฟล์ฟีเจอร์

---

## 📋 สิ่งที่ต้องเตรียมก่อนเริ่ม (Prerequisites)

| เครื่องมือ | สถานะ | วัตถุประสงค์ |
|---|---|---|
| **Git** | จำเป็น | Clone/สำรอง Vault และให้ AI ตรวจ `git status` / `git branch` |
| **AI Coding Assistant (1 ตัวขึ้นไป)** | จำเป็น | เช่น Claude Code, Antigravity, Cursor, Codex หรือ Gemini CLI |
| **Node.js 18+** *(แนะนำ 22+)* | แนะนำ | ใช้รัน `vault-check` และติดตั้ง 3rd-Party Skills |
| **[Obsidian](https://obsidian.md/)** | ไม่บังคับ | เปิดอ่าน Vault, กดลิงก์ข้ามไฟล์ และดู Graph View ได้สะดวกขึ้น |
| **Python 3 / Chrome หรือ Edge** | เฉพาะบาง Skill เสริม | ใช้เฉพาะเมื่อติดตั้ง `ui-ux-pro-max` หรือ `design-taste-frontend` |

---

## 🚀 เริ่มต้นใช้งาน (3 ขั้นตอน)

### ขั้นที่ 1: สร้าง Vault จาก Template
1. กดปุ่ม **"Use this template"** → **"Create a new repository"** บนหน้า [ReballKung/tony-stark-brain](https://github.com/ReballKung/tony-stark-brain)
2. ตั้งชื่อ Repository (เช่น `my-second-brain`) และแนะนำให้เลือกเป็น **Private** เพื่อความปลอดภัยของข้อมูลโปรเจกต์
3. Clone ลงเครื่องของคุณ:
   ```bash
   git clone https://github.com/<your-username>/my-second-brain.git
   ```

### ขั้นที่ 2: เชื่อมต่อ Skills (8 ตัวหลัก)

<details>
<summary><strong>Windows (PowerShell — ไม่ต้องเปิดสิทธิ์ Admin)</strong></summary>

```powershell
# ระบุ path ที่คุณ clone vault ไว้
$src = "D:\Workspace\my-second-brain\_skills"

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
</details>

<details>
<summary><strong>macOS / Linux (Bash / Zsh)</strong></summary>

```bash
# ระบุ path ที่คุณ clone vault ไว้
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
</details>

> **หมายเหตุสำหรับผู้ใช้ Cursor / Codex / AI อื่นๆ:** หากเครื่องมือไม่ได้อ่านโฟลเดอร์ skills อัตโนมัติ เพียงระบุในไฟล์กฎของโปรเจกต์ (`AGENTS.md`, `.cursorrules`, `CLAUDE.md`) ให้ AI อ่าน `<VAULT_PATH>/AGENTS.md` เป็นลำดับแรก ระบบจะทำงานได้ตามปกติ

### ขั้นที่ 3 (เพิ่มเติม): ติดตั้ง 3rd-Party Skills แนะนำ 25 ตัว
ติดตั้งชุด Skill เสริมด้านการวางแผน, TDD, Debugging, Code Review และ UI Design จาก GitHub ต้นฉบับโดยตรงในคำสั่งเดียว *(ต้องมี Node.js 18+)*:

- **Windows:** `powershell -ExecutionPolicy Bypass -File _skills/install-recommended.ps1`
- **macOS / Linux:** `bash _skills/install-recommended.sh`

ดูรายการ Skills ทั้งหมดได้ที่ [_skills/README.md](_skills/README.md)

---

## 🔄 รูปแบบการใช้งานประจำวัน

### กรณีใช้ AI 1 ตัว
```text
เริ่มวัน (/start-session) ──▶ ทำงาน / สร้างฟีเจอร์ (/new-feature) ──▶ จบวัน (/end-session)
```
- **เริ่มวัน:** AI อ่าน `status.md` และเทียบกับ `git status` จริง เพื่อสรุปงานค้างให้ทันที
- **จบวัน:** AI อัปเดต `status.md` และบันทึก 1 บรรทัดลง `log.md`

### กรณีใช้ AI 2 ตัวขึ้นไปสลับกัน
```text
AI ตัวที่ 1 ──▶ ส่งไม้ต่อ (/handoff) ──▶ AI ตัวที่ 2 รับไม้ต่อ ──▶ จบวัน (/end-session)
```
- **เมื่อจะสลับเครื่องมือหรือโควต้าใกล้หมด:** สั่ง `/handoff` เพื่อให้ AI สรุปสถานะลง `<project>/handoff.md` และสร้างข้อความพร้อมคัดลอก
- **ฝั่ง AI ตัวที่ 2:** วางข้อความที่คัดลอกมา AI จะอ่าน `handoff.md` และทำงานต่อจากจุดเดิมทันที

---

## 💬 คำสั่งที่ใช้บ่อย

| สถานการณ์ | คำสั่ง / สิ่งที่พิมพ์ | Skill |
|---|---|---|
| เพิ่มโปรเจกต์ใหม่เข้า Vault | `"สร้างโปรเจกต์ใหม่ชื่อ <name> อยู่ที่ <path>"` | `new-project` |
| เริ่มงานประจำวัน | `"เริ่มงาน"` หรือ `/start-session` | `start-session` |
| เริ่มฟีเจอร์ใหม่ | `"สร้างฟีเจอร์ใหม่ <name>"` หรือ `/new-feature` | `new-feature` |
| ซักแผนงานทีละข้อแบบมีตัวเลือก | `/grill-choice` | `grill-choice` |
| ขอวิเคราะห์/แนวทาง (ไม่ให้แก้โค้ดเอง) | ถามตามปกติ *(Mentor Mode เปิดเป็นค่าเริ่มต้น)* | `mentor-mode` |
| อนุญาตให้ AI แก้โค้ดในโปรเจกต์ | พิมพ์ `"แก้เลย"` หรือ `"implement"` | — |
| ส่งไม้ต่อให้ AI อีกตัว | `"ส่งไม้ต่อ"` หรือ `/handoff` | `handoff` |
| สรุปงานและปิดวัน | `"จบงาน"` หรือ `/end-session` | `end-session` |

---

## ⚙️ การปรับแต่งและดูแลระบบ

- **ปิด Mentor Mode:** ค่าเริ่มต้นใน [AGENTS.md](AGENTS.md) หัวข้อ 2 กำหนดให้ AI อธิบายและเสนอ diff ก่อนโดยไม่แก้โค้ดเอง หากต้องการให้ AI แก้โค้ดทันทีสามารถแก้ไขหรือลบหัวข้อดังกล่าวได้
- **ตรวจสุขภาพ Vault:**
  ```bash
  node _skills/vault-check/check.js
  ```
  สคริปต์จะค้นหาทุกโปรเจกต์ที่มี `status.md` อัตโนมัติ และรายงานลิงก์เสีย, ไฟล์ที่ไม่อัปเดตเกิน 7 วัน, handoff ค้าง และไฟล์ฟีเจอร์ที่ยาวเกิน 15 KB

---

## 📂 โครงสร้างโฟลเดอร์

```text
tony-stark-brain/
├── AGENTS.md                 # กฎกลางสำหรับ AI ทุกตัว
├── index.md                  # สารบัญโปรเจกต์ทั้งหมด
├── log.md                    # ประวัติการเปลี่ยนแปลงระดับ Vault
├── _rules/
│   └── fullstack-mentor.md   # กฎ 47 ข้อ (Senior FullStack Mentor)
├── _templates/               # แม่แบบโปรเจกต์, status, feature, ADR, handoff
├── _skills/                  # 8 Skills หลัก + สคริปต์ติดตั้ง 3rd-Party Skills
└── example-project/          # โปรเจกต์ตัวอย่าง (ลบออกได้เมื่อสร้างโปรเจกต์จริงแล้ว)
```
