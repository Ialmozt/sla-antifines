# SLA-ответы и антиштрафы для продавцов

Цель: автоматизировать работу с отзывами/чатами/SLA у продавцов маркетплейсов (WB/Ozon/YandexMarket/SMM) через n8n + отчёты + уведомления в Nextcloud Talk.

## Архитектура
- n8n v1.116.2 (Docker на barsik), прокси: `http://10.40.0.116:8899`, HTTPS.
- Уведомления: Nextcloud Talk (prod: 7p65wqhd).
- Каталог API: `data/*.csv|xlsx` → автоген `docs/API_ENDPOINTS.md`.
- CI/CD: GitHub Actions (auto-sync), pre-commit.

## Быстрый старт
bash scripts/antifines_preflight.sh
source .venv/bin/activate && python3 scripts/export_endpoints_to_md.py
bash scripts/antifines_commit.sh

## Папки
- docs/ — документация
- n8n_workflows/ — JSON воркфлоу (v1.116.2)
- scripts/ — DevOps-скрипты
- data/ — CSV/XLSX каталога

## Политика коммитов
Conventional Commits: feat/fix/docs/chore/ci.
