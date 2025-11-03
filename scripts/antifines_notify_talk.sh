#!/usr/bin/env bash
set -euo pipefail
source .env
MSG="${1:-✅ SLA Antifines: job done}"
curl -s -k -x "$PROXY_URL" -X POST "${TALK_URL}/${TALK_ROOM}" \
  -H "OCS-APIRequest: true" \
  -H "Authorization: Bearer ${TALK_TOKEN}" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "message=${MSG}" >/dev/null || true
