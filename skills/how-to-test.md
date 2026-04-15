# Skill: how-to-test

**When to use**: 에이전트가 이 레포에 테스트를 작성/수정할 때.

## 절차

1. 변경 대상의 **계층**을 확인한다 (`docs/architecture.md`).
2. 해당 계층의 테스트 종류를 고른다:
   - `Types` → 단위 테스트만. 외부 없음.
   - `Repo` → 통합 테스트. 실제 DB 또는 testcontainer. 목 금지.
   - `Service` → 단위 테스트 + Repo fake.
   - `Runtime`/`UI` → 통합 또는 E2E.
3. [docs/quality/testing.md](../docs/quality/testing.md)의 피라미드/금지 사항을 확인.
4. 대상 기능의 품질 등급을 확인([docs/quality/README.md](../docs/quality/README.md)). 등급에 맞는 커버리지/뮤테이션 테스트를 추가.
5. `scripts/test-fast.sh`가 통과하는지 확인 후 커밋.
6. 구조 테스트(`tests/architecture/`)는 항상 실행되어야 한다.

## 체크리스트

- [ ] 테스트 이름이 "무엇을 검증하는지"를 평문으로 설명하는가
- [ ] assert 메시지가 실패 시 원인을 즉시 알려주는가
- [ ] 시계/난수/외부 I/O가 주입 가능한가
- [ ] 목 대신 fake을 썼는가
- [ ] 설계 문서(`docs/design/...`)의 "검증" 섹션이 이 테스트를 반영하는가
