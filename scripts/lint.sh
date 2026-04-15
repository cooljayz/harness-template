#!/usr/bin/env bash
# Pre-commit 게이트. 프로젝트 언어가 정해지면 각 블록의 주석을 해제.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# Node / TS
# [ -f package.json ] && npx --no-install tsc --noEmit && npx --no-install eslint .

# Python
# [ -f pyproject.toml ] && uv run ruff check . && uv run mypy .

# Go
# [ -f go.mod ] && go vet ./... && gofmt -l . | (! grep .)

# Markdown / 문서 링크 드리프트(간단)
if command -v grep >/dev/null 2>&1; then
  # AGENTS.md에서 참조하는 경로가 실제로 존재하는지 점검
  missing=0
  while IFS= read -r path; do
    if [ ! -e "$path" ]; then
      echo "broken link: $path (referenced by AGENTS.md)"
      missing=1
    fi
  done < <(grep -oE '\(([a-zA-Z0-9_./-]+\.md)\)' AGENTS.md | tr -d '()' || true)
  [ "$missing" -eq 0 ]
fi

echo "lint ok"
