# 📜 Second Brain Changelog

บันทึกประวัติการเปลี่ยนแปลงระดับ Vault (โครงสร้าง, กฎกลาง, Skills) แบบ Append-only
*(log งานของแต่ละโปรเจกต์ให้บันทึกใน `<project>/log.md`)*

---

- 2026-11-25 [Template] เริ่มต้นโครงสร้าง Second Brain Template (`AGENTS.md`, `_rules/`, `_templates/`, `_skills/`, `example-project/`)
- 2026-11-26 [Claude Code] เพิ่ม "รูปแบบคำตอบงาน (Step by Step)" ใน AGENTS.md หัวข้อ 2: แผนก่อน → ทีละขั้น → พิมพ์ "เสร็จแล้ว ตรวจสอบโค้ดให้หน่อย" ให้ AI ตรวจ → สรุปจบงาน, เนื้อหายาวเขียนลง <project>/guides/ ตาม _templates/task-guide.md (+ mentor-mode skill)
- 2026-11-26 [Claude Code] ปรับรูปแบบคำตอบงานเป็นสไตล์ Claude Code: ไม่มี heading/emoji ในแชต ใช้ ● ☐ ▶ ☒ ✓ ✗ ※ และปิดท้าย "ต่อไป:"
- 2026-11-26 [Claude Code] รูปแบบคำตอบงาน v2: แผนอยู่ในกล่องโค้ด (☐ ▶ ☒), ลด backtick/ตัวหนา, ผลตรวจ ✓ ✗ ※, ข้อยกเว้น "ตอบรวดเดียว" เมื่อแก้จุดเดียว
- 2026-11-26 [Claude Code] แก้จากการทดสอบจริง: ทุกขั้นต้องมีคำสั่ง terminal (install ฯลฯ) ในแชต + "สิ่งที่ต้องทำ" เป็นข้อ (เดิมขั้นที่ 1 เว็บ To Do บอกแค่ "ลง express" ไม่มีคำสั่ง)
- 2026-11-26 [Claude Code] คำตอบแรกของงาน Step by Step ต้องมี "ผลลัพธ์ที่จะได้" (หน้าตา/ตัวอย่าง) ก่อนแผน และถามว่าตรงกับที่คาดไว้ไหมก่อนเริ่ม
- 2026-11-26 [Claude Code] "ผลลัพธ์ที่จะได้" งาน UI: เลิกวาดกล่องด้วยตัวอักษร (ไทยทำให้เบี้ยว) ใช้ จะเห็นอะไร/กดแล้วเกิดอะไร/ได้อะไร + งานใหญ่ทำ prototypes/<งาน>/index.html
- 2026-11-26 [Claude Code] ลด token: ย้ายรูปแบบคำตอบ (Mentor Mode + Step by Step) จาก AGENTS.md ไป _rules/response-format.md และให้อ่าน fullstack-mentor.md เฉพาะงานโค้ด
- 2026-11-26 [Claude Code] เพิ่ม _rules/agent-ops.md (ประหยัด token, เลือกรุ่น Haiku/Sonnet/Opus, brief subagent) + self-check หา helper เดิมก่อนเขียนใหม่ ใน response-format.md · ไม่เอาการแจกงานโค้ดอัตโนมัติ/auto MR เพราะขัด Mentor Mode
- 2026-11-26 [Claude Code] เพิ่มโหมดด่วน `_rules/fast-mode.md` (พิมพ์ "โหมดด่วน" → AI เขียนให้จนจบ, ผู้ใช้ commit/MR เอง, มีโน้ต 3 อย่างกลับมาเรียน) ใช้ได้ทั้ง Claude Code/Antigravity + ช่อง "โหมด" ใน handoff template
