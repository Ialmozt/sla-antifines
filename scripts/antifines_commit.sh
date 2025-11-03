#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
if [ -f .pre-commit-config.yaml ]; then
  source .venv/bin/activate || true
  pre-commit run --all-files || true
fi
git add .
git commit -m "chore: autosync $(date -u +%Y-%m-%dT%H:%M:%SZ)" || true
git push origin main || true
