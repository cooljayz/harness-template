# Harness Engineering Workspace

이 레포는 **코딩 에이전트(Codex / Claude Code 등)가 신뢰성 있게 일할 수 있도록 설계된 "하네스(harness)"** 스캐폴드다. OpenAI의 [Harness Engineering](https://openai.com/index/harness-engineering/) 글과 Martin Fowler의 [후속 정리](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html)의 원칙을 따른다.

## 핵심 아이디어

에이전트는 "코드를 쓸 줄 아는 사람"이 아니라 **환경·제약·피드백 루프에 반응하는 시스템**이다. 따라서 사람의 일은 더 이상 타이핑이 아니라:

1. **의도를 명세**하고 (`docs/design/`)
2. **경계를 기계적으로 강제**하며 (`tests/architecture/`, 린터, 구조 테스트)
3. **피드백 신호를 에이전트가 읽을 수 있는 형태로** 만드는 것 (`docs/quality/observability.md`, `artifacts/`)

## 레이아웃

```
AGENTS.md              # 얇은 진입점 — 여기에 지식을 쓰지 말 것
docs/
  architecture.md      # 계층 의존성 규칙 (Types→Config→Repo→Service→Runtime→UI)
  design/              # 기능별 설계 문서 (depth-first 분해의 단위)
  plans/               # 진행 중 실행 계획
  quality/             # 품질 등급, 관측성, 테스트 전략
skills/
  how-to-test.md       # 이 레포에서 테스트 쓰는 법
  code-review.md       # LLM 친화적 의미 리뷰 체크리스트
  doc-gardening.md     # 문서 드리프트 감지/수정 (문서만 수정)
scripts/
  bootstrap.sh         # 재현 가능한 세팅
  lint.sh              # pre-commit 게이트
  test-fast.sh         # 빠른 테스트 게이트
tests/
  architecture/        # 계층 규칙 구조 테스트
artifacts/              # 에이전트가 읽는 실패/런 출력
```

## 시작하기

```bash
./scripts/bootstrap.sh
```

그 다음:

1. 프로젝트 언어/프레임워크를 정하고 `scripts/lint.sh`, `scripts/test-fast.sh`의 TODO를 채운다.
2. `tests/architecture/` 에 실제 구조 테스트를 추가한다 (예: TS는 dependency-cruiser, Python은 import-linter).
3. 첫 설계 문서를 `docs/design/YYYY-MM-DD-<slug>.md`에 커밋한다.
4. 에이전트에게 `AGENTS.md`를 읽고 그 설계를 구현하라고 지시한다.
5. `skills/doc-gardening.md`를 CI나 cron에 등록해 드리프트를 꾸준히 수정한다.

## 원칙 요약 (위반하지 말 것)

- AGENTS.md는 얇게. 지식은 링크된 깊은 문서에.
- 아키텍처 규칙은 문서가 아니라 **테스트**로 강제.
- 문서와 코드는 **같은 PR**에서 갱신.
- 목(mock) 대신 fake. 실패 메시지는 에이전트가 읽을 수 있도록 구조화.
- Depth-first: 큰 작업은 `design → code → review → test → doc-update` 블록으로 분해.
