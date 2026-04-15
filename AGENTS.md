# AGENTS.md

> 이 파일은 **얇은 진입점**이다. 실제 지식은 아래 링크된 문서에 있고, 모두 레포와 함께 버전 관리된다.
> 에이전트는 작업 전에 관련 문서를 먼저 읽고, 작업 후 변경이 있으면 해당 문서도 함께 갱신해야 한다.

## 1. Sources of Truth (읽는 순서)

1. [docs/architecture.md](docs/architecture.md) — 계층 의존성, 모듈 경계, 아키텍처 불변식
2. [docs/design/](docs/design/) — 기능별 설계 문서 (depth-first 분해 단위)
3. [docs/plans/](docs/plans/) — 현재 진행 중인 실행 계획
4. [docs/quality/](docs/quality/) — 품질 등급, 테스트 전략, 관측성 기준

## 2. 작업 방식 (Depth-first)

모든 작업은 다음 블록으로 분해한다:
`design → code → review → test → doc-update`

각 블록은 독립적인 PR로 끊는 것을 선호한다. 블록 간 문맥은 `docs/plans/` 안의 실행 계획 문서로 전달한다.

## 3. Guides & Sensors (반드시 통과)

변경 사항은 아래 검증을 **모두** 통과해야 병합된다.

### Pre-commit (빠른 피드백)
- 타입 체크 / LSP 진단 0건
- 린터 + 포매터 (`scripts/lint.sh`)
- 빠른 단위 테스트 (`scripts/test-fast.sh`)

### Pre-merge (구조적 무결성)
- 계층 의존성 테스트 (`tests/architecture/` — [docs/architecture.md](docs/architecture.md) 규칙 강제)
- 변경된 모듈의 전체 테스트
- 코드 리뷰 스킬: [skills/code-review.md](skills/code-review.md)

### Background (드리프트 감지)
- Doc-gardening: [skills/doc-gardening.md](skills/doc-gardening.md) — 문서/코드 드리프트를 주기적으로 스캔해 수정 PR 제출

## 4. 기본 스킬

- [skills/how-to-test.md](skills/how-to-test.md) — 이 레포에서 테스트를 "어떻게" 쓰는지
- [skills/code-review.md](skills/code-review.md) — LLM 친화적 의미 리뷰 체크리스트
- [skills/doc-gardening.md](skills/doc-gardening.md) — 문서 드리프트 감지/수정

## 5. 금지 사항

- `docs/architecture.md`의 계층 규칙을 우회하지 말 것 — 규칙 자체를 먼저 바꾸는 PR을 올려라
- 문서 갱신 없이 동작을 바꾸지 말 것 — 드리프트는 다음 doc-gardening 주기에 잡혀 되돌아온다
- AGENTS.md에 지식을 직접 쓰지 말 것 — 포인터만 둔다
