#!/usr/bin/env bash
set -euo pipefail

site_root=$(cd "$(dirname "$0")/.." && pwd)
home="$site_root/index.html"
support="$site_root/support/index.html"
privacy="$site_root/privacy/index.html"
translations="$site_root/language-toggle.js"

require_text() {
  grep -Fq "$2" "$1" || { echo "missing copy in $1: $2"; exit 1; }
}

require_text "$home" 'Preview verified embroidery formats in Finder'
require_text "$home" 'See supported formats and limits'
require_text "$home" 'Illustration only; file details vary by format.'
require_text "$support" 'PES, DST, JEF, EXP, PEC, VP3, SEW, XXX, PCM, PCS, PCD, and PCQ'
require_text "$support" 'EMB files with a readable embedded image'
require_text "$support" 'EMD is not supported yet.'
require_text "$support" 'Apple Silicon Mac running macOS 15 or later'
require_text "$support" 'No embroidery file is attached automatically.'
require_text "$privacy" 'anonymous local health receipt'
require_text "$privacy" 'browser local storage'
require_text "$privacy" 'Files are never attached automatically'
require_text "$translations" 'PES、DST、JEF、EXP、PEC、VP3、SEW、XXX、PCM、PCS、PCD 和 PCQ'
require_text "$translations" 'EMD 尚未支持。'

if grep -Fq 'Preview PES, DST, and JEF embroidery files directly in Finder' "$home"; then
  echo 'stale three-format homepage claim'
  exit 1
fi

echo 'Website content contract passed.'
