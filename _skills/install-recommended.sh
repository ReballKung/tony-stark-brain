#!/usr/bin/env bash
# ติดตั้ง 3rd-Party Skills แนะนำ (25 ตัว จาก 4 แหล่งต้นฉบับ) แบบ Global
# สิ่งที่ต้องมีก่อนรัน: Node.js 18+ (แนะนำ 22+) และ Git
# วิธีรัน: bash _skills/install-recommended.sh

set -euo pipefail

if ! command -v npx >/dev/null 2>&1; then
  echo "❌ ไม่พบคำสั่ง npx กรุณาติดตั้ง Node.js 18+ (แนะนำ 22+) ก่อนที่ https://nodejs.org"
  exit 1
fi

repos=(
  "mattpocock/skills"
  "obra/superpowers"
  "nextlevelbuilder/ui-ux-pro-max-skill"
  "Leonxlnx/taste-skill"
)

for repo in "${repos[@]}"; do
  echo ""
  echo ">>> กำลังติดตั้ง $repo ..."
  npx -y skills add "$repo" -g -y
done

echo ""
echo "✅ ติดตั้ง 3rd-Party Skills ครบแล้วครับ!"
echo "⚠️ หมายเหตุ: หากเปิดใช้ Mentor Mode ไว้ skill ที่เขียนโค้ดเองได้ (เช่น executing-plans, TDD) จะต้องเคารพกฎใน AGENTS.md หัวข้อ 2"
