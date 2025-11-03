SHELL := /bin/bash

.PHONY: preflight export commit notify full

preflight:
	@bash scripts/antifines_preflight.sh

export:
	@. .venv/bin/activate && python3 scripts/export_endpoints_to_md.py

commit:
	@bash scripts/antifines_commit.sh

notify:
	@bash scripts/antifines_notify_talk.sh "✅ SLA-Antifines job completed"

full:
	@make preflight && make export && make commit && make notify
