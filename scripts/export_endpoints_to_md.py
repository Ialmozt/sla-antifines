#!/usr/bin/env python3
import pandas as pd
from pathlib import Path
from datetime import datetime

DATA_DIR = Path(__file__).resolve().parent.parent / "data"
DOCS_MD = Path(__file__).resolve().parent.parent / "docs" / "API_ENDPOINTS.md"


def load_latest_csv() -> pd.DataFrame:
    csvs = sorted(DATA_DIR.glob("marketplace_api_endpoints_*.csv"))
    if not csvs:
        raise SystemExit(
            "No CSV in data/. Put latest catalog CSV named marketplace_api_endpoints_*.csv"
        )
    return pd.read_csv(csvs[-1])


def main():
    df = load_latest_csv()
    required = ["marketplace", "area", "method", "path", "summary", "source"]
    for r in required:
        if r not in df.columns:
            raise SystemExit(f"CSV missing column: {r}")
    df = df.sort_values(by=["marketplace", "area", "method", "path"])
    lines = []
    lines.append(f"# API Endpoints Catalog\n")
    lines.append(
        f"_Generated: {datetime.utcnow().strftime('%Y-%m-%d %H:%M:%SZ')} UTC_\n"
    )
    lines.append("| marketplace | area | method | path | summary | source |")
    lines.append("|---|---|---|---|---|---|")
    for _, r in df.iterrows():
        lines.append(
            f"| {r['marketplace']} | {r['area']} | {r['method']} | `{r['path']}` | {r.get('summary','')} | {r.get('source','')} |"
        )
    DOCS_MD.write_text("\n".join(lines), encoding="utf-8")
    print(f"✅ Exported to {DOCS_MD}")


if __name__ == "__main__":
    main()
