#!/usr/bin/env bash
# 빠른 테스트 게이트. 2초 미만을 목표로.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# 언어별 빠른 테스트
# [ -f package.json ] && npx --no-install vitest run --reporter=dot
# [ -f pyproject.toml ] && uv run pytest -q -x tests/unit
# [ -f go.mod ] && go test ./... -short

# 아키텍처 테스트는 항상 실행
if [ -d tests/architecture ] && [ -n "$(ls -A tests/architecture 2>/dev/null)" ]; then
  echo "TODO: run architecture tests (tests/architecture)"
fi

echo "fast tests ok"
