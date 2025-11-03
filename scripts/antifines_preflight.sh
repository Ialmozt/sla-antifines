#!/usr/bin/env bash
set -euo pipefail
source .env
LOG="data/preflight_$(date -u +%Y%m%d_%H%M%S).log"
echo "=== SLA Antifines Preflight $(date -u +%F\ %T) UTC ===" | tee -a "$LOG"

for url in \
  "https://cloud.guzpc.ru/status.php" \
  "https://dev.wildberries.ru/openapi/analytics" \
  "https://docs.ozon.ru/global/en/api/" \
  "https://yandex.com/dev/market/partner" \
  "https://openapi.megamarket.ru"
do
  echo "→ $url" | tee -a "$LOG"
  curl -s -k -x "$PROXY_URL" -I "$url" | head -n 1 | tee -a "$LOG"
done
echo "=== DONE ===" | tee -a "$LOG"
