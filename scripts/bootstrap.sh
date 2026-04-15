#!/usr/bin/env bash
# Bootstrap: 새 환경에서 하네스를 재현 가능하게 세팅한다.
# 에이전트가 "환경 문제"로 멈추지 않게 하는 것이 목적.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "==> Harness bootstrap in $ROOT"

# 1. 필수 디렉토리
mkdir -p docs/design docs/plans docs/quality skills scripts tests/architecture artifacts

# 2. Git
if [ ! -d .git ]; then
  echo "==> git init"
  git init -q
fi

# 3. 언어별 훅 (프로젝트 언어가 정해지면 이 블록을 채운다)
# 예: Node
#   [ -f package.json ] && npm install
# 예: Python
#   [ -f pyproject.toml ] && uv sync
# 예: Go
#   [ -f go.mod ] && go mod download

# 4. Pre-commit 훅 연결 (있다면)
if [ -f scripts/lint.sh ]; then
  mkdir -p .git/hooks
  cat > .git/hooks/pre-commit <<'HOOK'
#!/usr/bin/env bash
set -e
./scripts/lint.sh
./scripts/test-fast.sh
HOOK
  chmod +x .git/hooks/pre-commit
  echo "==> pre-commit hook installed"
fi

echo "==> done. 다음 단계:"
echo "   1) 언어/프레임워크를 정하고 scripts/lint.sh, scripts/test-fast.sh를 채운다"
echo "   2) tests/architecture/ 에 계층 규칙 테스트를 작성한다"
echo "   3) docs/design/ 에 첫 설계 문서를 커밋한 뒤 에이전트 작업 시작"
