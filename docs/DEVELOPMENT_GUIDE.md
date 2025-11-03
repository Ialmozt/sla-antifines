# Development Guide

## Версии
- n8n: 1.116.2 (импорт JSON через Ctrl+V).
- Python: 3.10+.
- Proxy: http://10.40.0.116:8899.

## Правила
1) Новые эндпоинты → CSV/XLSX → python scripts/export_endpoints_to_md.py.
2) Перед добавлением узла n8n: префлайт cURL → ответ 200.
3) Скрипты/конфиги — всегда "на замену".
4) Коммиты — Conventional Commits.

## Качество
- pre-commit: формат/линты.
- GitHub Actions: авто-синк и автодоки.
