# Execution Plans

진행 중인 작업의 **살아있는** 실행 계획을 둔다. 설계 문서(`docs/design/`)가 "무엇을 만들지"라면, 플랜은 "지금 어디까지 와 있는지"다.

## 네이밍

`<slug>.md` — 완료되면 `docs/design/`의 설계 문서로 머지하거나 `archive/`로 이동.

## 템플릿

```markdown
# <작업 이름>

**설계**: docs/design/2026-04-15-user-auth.md
**상태**: in-progress | blocked | done
**담당 에이전트**: <codex-run-id 또는 claude session>

## 체크리스트
- [x] 블록 1: 타입 정의 (#PR-123)
- [ ] 블록 2: Repo 어댑터
- [ ] 블록 3: Service 오케스트레이션
- [ ] 블록 4: Runtime 바인딩
- [ ] 블록 5: UI

## 열린 질문
- ...

## 결정 로그
- 2026-04-15: 이메일 중복 체크를 Service가 아닌 Repo 유니크 제약으로 강제하기로 결정
```
