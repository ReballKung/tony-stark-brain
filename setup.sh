#!/usr/bin/env bash
# 🦾 Tony Stark Brain — 1-Click Setup (macOS / Linux)
# วิธีใช้: เปิด Terminal ในโฟลเดอร์นี้แล้วรัน
#   bash setup.sh

set -euo pipefail

# หา path ของโฟลเดอร์นี้โดยอัตโนมัติ (ผู้ใช้ไม่ต้องแก้ path เอง)
VAULT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$VAULT_PATH/_skills"

echo "========================================"
echo "  Tony Stark Brain — Setup Wizard"
echo "========================================"
echo "Vault Path: $VAULT_PATH"
echo ""

link_skills() {
  local name="$1"
  local root="$2"
  local target="$3"

  if [ -d "$root" ]; then
    mkdir -p "$target"
    echo ">>> เชื่อม Skills ไปยัง $name ($target)"
    for dir in "$SKILLS_SRC"/*/; do
      skill_name="$(basename "$dir")"
      if [ ! -e "$target/$skill_name" ]; then
        ln -s "$dir" "$target/$skill_name"
        echo "  + linked $skill_name"
      else
        echo "  = $skill_name (มีอยู่แล้ว)"
      fi
    done
  else
    echo ">>> ข้าม $name (ยังไม่พบโฟลเดอร์ $root ในเครื่อง)"
  fi
}

link_skills "Claude Code" "$HOME/.claude" "$HOME/.claude/skills"
link_skills "Antigravity" "$HOME/.gemini" "$HOME/.gemini/config/skills"

echo ""
echo "✅ เชื่อมต่อ Skills หลักเรียบร้อย"
echo ""

read -r -p "ต้องการติดตั้ง 3rd-Party Skills เสริมอีก 25 ตัวด้วยหรือไม่? (y/N): " ans
if [[ "$ans" =~ ^[Yy]$ ]]; then
  bash "$SKILLS_SRC/install-recommended.sh"
else
  echo "ข้ามการติดตั้ง 3rd-Party Skills (สามารถติดตั้งภายหลังได้ด้วย bash _skills/install-recommended.sh)"
fi

echo ""
if command -v node >/dev/null 2>&1; then
  echo ">>> กำลังตรวจสุขภาพ Vault (vault-check)..."
  node "$SKILLS_SRC/vault-check/check.js" "$VAULT_PATH"
else
  echo "⚠️ ไม่พบ Node.js — ข้ามการรัน vault-check (แนะนำติดตั้ง Node.js 18+ ที่ https://nodejs.org)"
fi

echo ""
echo "🎉 ติดตั้งเสร็จสมบูรณ์! พร้อมใช้งาน Tony Stark Brain แล้วครับ"
echo "ขั้นตอนถัดไป: เปิดโปรเจกต์โค้ดของคุณใน AI Assistant แล้วพิมพ์ 'สร้างโปรเจกต์ใหม่' หรือดูคู่มือใน GUIDE-JUNIOR.md"
