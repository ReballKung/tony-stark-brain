# 📜 Second Brain Changelog

บันทึกประวัติการเปลี่ยนแปลงระดับ Vault (โครงสร้าง, กฎกลาง, Skills) แบบ Append-only
*(log งานของแต่ละโปรเจกต์ให้บันทึกใน `<project>/log.md`)*

---

- 2026-11-25 [Template] เริ่มต้นโครงสร้าง Second Brain Template (`AGENTS.md`, `_rules/`, `_templates/`, `_skills/`, `example-project/`)
- 2026-11-26 [Claude Code] เพิ่ม "รูปแบบคำตอบงาน (Step by Step)" ใน AGENTS.md หัวข้อ 2: แผนก่อน → ทีละขั้น → พิมพ์ "เสร็จแล้ว ตรวจสอบโค้ดให้หน่อย" ให้ AI ตรวจ → สรุปจบงาน, เนื้อหายาวเขียนลง <project>/guides/ ตาม _templates/task-guide.md (+ mentor-mode skill)
- 2026-11-26 [Claude Code] ปรับรูปแบบคำตอบงานเป็นสไตล์ Claude Code: ไม่มี heading/emoji ในแชต ใช้ ● ☐ ▶ ☒ ✓ ✗ ※ และปิดท้าย "ต่อไป:"
- 2026-11-26 [Claude Code] รูปแบบคำตอบงาน v2: แผนอยู่ในกล่องโค้ด (☐ ▶ ☒), ลด backtick/ตัวหนา, ผลตรวจ ✓ ✗ ※, ข้อยกเว้น "ตอบรวดเดียว" เมื่อแก้จุดเดียว
