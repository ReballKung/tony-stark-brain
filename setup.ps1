# 🦾 Tony Stark Brain — 1-Click Setup (Windows PowerShell)
# วิธีใช้: เปิด Terminal ในโฟลเดอร์นี้แล้วรัน
#   powershell -ExecutionPolicy Bypass -File setup.ps1

$ErrorActionPreference = "Stop"

# [เรียนรู้] $PSScriptRoot คือตำแหน่งโฟลเดอร์ของสคริปต์นี้ ทำให้ผู้ใช้ไม่ต้องแก้ path เอง
$vaultPath = $PSScriptRoot
$skillsSrc = Join-Path $vaultPath "_skills"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Tony Stark Brain — Setup Wizard" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Vault Path: $vaultPath`n"

# 1) เชื่อม 8 Skills หลักไปยัง Claude Code และ Antigravity (เฉพาะโฟลเดอร์ที่มีอยู่หรือสร้างได้)
$targets = @(
  @{ Name = "Claude Code"; Path = "$env:USERPROFILE\.claude\skills"; Root = "$env:USERPROFILE\.claude" },
  @{ Name = "Antigravity"; Path = "$env:USERPROFILE\.gemini\config\skills"; Root = "$env:USERPROFILE\.gemini" }
)

$linkedCount = 0
foreach ($t in $targets) {
  if (Test-Path $t.Root) {
    if (-not (Test-Path $t.Path)) { New-Item -ItemType Directory -Path $t.Path -Force | Out-Null }
    Write-Host ">>> เชื่อม Skills ไปยัง $($t.Name) ($($t.Path))" -ForegroundColor Yellow
    Get-ChildItem $skillsSrc -Directory | ForEach-Object {
      $dst = Join-Path $t.Path $_.Name
      if (-not (Test-Path $dst)) {
        New-Item -ItemType Junction -Path $dst -Target $_.FullName | Out-Null
        Write-Host "  + linked $($_.Name)" -ForegroundColor Green
        $linkedCount++
      } else {
        Write-Host "  = $($_.Name) (มีอยู่แล้ว)" -ForegroundColor DarkGray
      }
    }
  } else {
    Write-Host ">>> ข้าม $($t.Name) (ยังไม่พบโฟลเดอร์ $($t.Root) ในเครื่อง)" -ForegroundColor DarkGray
  }
}

Write-Host "`n✅ เชื่อมต่อ Skills หลักเรียบร้อย (เพิ่มใหม่ $linkedCount รายการ)" -ForegroundColor Green

# 2) ถามว่าต้องการติดตั้ง 3rd-Party Skills เสริม 25 ตัวหรือไม่
Write-Host ""
$ans = Read-Host "ต้องการติดตั้ง 3rd-Party Skills เสริมอีก 25 ตัวด้วยหรือไม่? (y/N)"
if ($ans -match "^[Yy]") {
  & (Join-Path $skillsSrc "install-recommended.ps1")
} else {
  Write-Host "ข้ามการติดตั้ง 3rd-Party Skills (สามารถติดตั้งภายหลังได้ด้วย _skills/install-recommended.ps1)" -ForegroundColor DarkGray
}

# 3) ตรวจสุขภาพ Vault ด้วย vault-check (ถ้ามี Node.js)
Write-Host ""
if (Get-Command node -ErrorAction SilentlyContinue) {
  Write-Host ">>> กำลังตรวจสุขภาพ Vault (vault-check)..." -ForegroundColor Cyan
  node (Join-Path $skillsSrc "vault-check\check.js") $vaultPath
} else {
  Write-Host "⚠️ ไม่พบ Node.js — ข้ามการรัน vault-check (แนะนำติดตั้ง Node.js 18+ ที่ https://nodejs.org)" -ForegroundColor Yellow
}

Write-Host "`n🎉 ติดตั้งเสร็จสมบูรณ์! พร้อมใช้งาน Tony Stark Brain แล้วครับ" -ForegroundColor Green
Write-Host "ขั้นตอนถัดไป: เปิดโปรเจกต์โค้ดของคุณใน AI Assistant แล้วพิมพ์ 'สร้างโปรเจกต์ใหม่' หรือดูคู่มือใน GUIDE-JUNIOR.md" -ForegroundColor Cyan
