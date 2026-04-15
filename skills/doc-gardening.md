# Skill: doc-gardening

**When to use**: 주기적으로(예: 매일 또는 PR 머지 후) 실행되어 문서와 코드 사이의 드리프트를 잡아내는 에이전트 작업.

## 절차

1. 아래 문서들을 실제 코드와 비교한다:
   - `docs/architecture.md` 의 계층 규칙 → `tests/architecture/`와 실제 import 그래프
   - `docs/design/*.md` 의 공개 인터페이스 → 실제 코드의 export
   - `docs/quality/observability.md` 의 로그/메트릭 이름 → 코드에서 실제로 emit되는 이름
   - 각 모듈의 `README.md` → 실제 파일 구조
2. 불일치가 발견되면:
   - 문서가 잘못됐으면: 문서를 고치는 PR
   - 코드가 잘못됐으면: 이슈를 열고 사람 리뷰 요청 (자동 수정 금지)
3. PR 제목: `docs: sync <target> with code` / 본문에 diff 요약.

## 금지

- 행동(코드)을 바꾸지 말 것. 이 스킬은 **문서만** 수정한다.
- AGENTS.md나 `docs/architecture.md`의 의미를 바꾸지 말 것 — 링크/타이포/표현만.

## 실행 방법

`scripts/doc-garden.sh` (TODO: 사람이 첫 회 수동 실행 후 cron/CI로 등록)
