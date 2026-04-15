# Design Docs

기능 단위 설계 문서를 여기에 둔다. 에이전트는 코드를 쓰기 전에 이곳에 설계 문서를 먼저 커밋한다.

## 파일 네이밍

`YYYY-MM-DD-<slug>.md` — 예: `2026-04-15-user-auth.md`

## 템플릿

```markdown
# <기능 이름>

## 문제 (Problem)
무엇을, 왜 해결하는가. 사용자 관점.

## 제약 (Constraints)
- 아키텍처 계층: 이 변경이 속한 계층
- 성능/보안/호환성 제약

## 설계 (Design)
- 도입/수정되는 타입
- 공개 인터페이스
- 데이터 흐름

## 분해 (Depth-first Breakdown)
- [ ] 블록 1: ...
- [ ] 블록 2: ...
- [ ] 블록 3: ...

## 검증 (How we know it works)
- 단위 테스트 대상
- 통합 테스트 시나리오
- 관측 지표

## 대안 (Alternatives Considered)
왜 이 설계를 택했는가.
```

## ADR (Architecture Decision Record)

아키텍처에 영향을 주는 결정은 `adr-NNN-<slug>.md` 형식으로 별도 기록.
