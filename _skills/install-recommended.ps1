# ติดตั้ง 3rd-Party Skills แนะนำ (25 ตัว จาก 4 แหล่งต้นฉบับ) แบบ Global
# สิ่งที่ต้องมีก่อนรัน: Node.js 18+ (แนะนำ 22+) และ Git
# วิธีรัน: powershell -ExecutionPolicy Bypass -File _skills/install-recommended.ps1

$ErrorActionPreference = "Stop"

if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
  Write-Host "❌ ไม่พบคำสั่ง npx กรุณาติดตั้ง Node.js 18+ (แนะนำ 22+) ก่อนที่ https://nodejs.org" -ForegroundColor Red
  exit 1
}

$repos = @(
  @{ Name = "mattpocock/skills (grill-me, grilling)"; Repo = "mattpocock/skills" },
  @{ Name = "obra/superpowers (15 skills: planning, TDD, debugging, review)"; Repo = "obra/superpowers" },
  @{ Name = "nextlevelbuilder/ui-ux-pro-max-skill (7 skills: UI/UX, design system, slides)"; Repo = "nextlevelbuilder/ui-ux-pro-max-skill" },
  @{ Name = "Leonxlnx/taste-skill (design-taste-frontend — ต้องมี Node 22+ และ Chrome/Edge)"; Repo = "Leonxlnx/taste-skill" }
)

foreach ($item in $repos) {
  Write-Host "`n>>> กำลังติดตั้ง $($item.Name) ..." -ForegroundColor Cyan
  npx -y skills add $item.Repo -g -y
}

Write-Host "`n✅ ติดตั้ง 3rd-Party Skills ครบแล้วครับ!" -ForegroundColor Green
Write-Host "⚠️ หมายเหตุ: หากเปิดใช้ Mentor Mode ไว้ skill ที่เขียนโค้ดเองได้ (เช่น executing-plans, TDD) จะต้องเคารพกฎใน AGENTS.md หัวข้อ 2" -ForegroundColor Yellow
