#!/usr/bin/env bash
set -euo pipefail

site_root=$(cd "$(dirname "$0")/.." && pwd)
pages=("$site_root/index.html" "$site_root/support/index.html" "$site_root/privacy/index.html")

for page in "${pages[@]}"; do
  grep -q 'language-toggle.js' "$page" || { echo "missing language switcher: $page"; exit 1; }
  grep -q 'data-i18n=' "$page" || { echo "missing localizable copy: $page"; exit 1; }
done

grep -q "'zh-CN'" "$site_root/language-toggle.js" || { echo 'missing Simplified Chinese dictionary'; exit 1; }
grep -q 'localStorage' "$site_root/language-toggle.js" || { echo 'missing saved language preference'; exit 1; }

echo 'Localization contract passed.'
