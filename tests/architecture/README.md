# Architecture Tests

여기의 테스트는 `docs/architecture.md`의 계층 규칙을 **기계적으로** 강제한다.
에이전트는 이 테스트를 우회하지 않는다 — 규칙을 바꾸려면 이 테스트와 `docs/architecture.md`를 **같은 PR**에서 동시에 수정해야 한다.

## 도구 예시

- **Java/Kotlin**: [ArchUnit](https://www.archunit.org/)
- **TypeScript**: [dependency-cruiser](https://github.com/sverweij/dependency-cruiser), `eslint-plugin-boundaries`
- **Python**: [import-linter](https://import-linter.readthedocs.io/)
- **Go**: `go-arch-lint`, 또는 `go list -deps` 기반 커스텀

## 최소 체크리스트

1. `Types`는 어떤 상위 계층도 import하지 않는다.
2. 계층 간 의존은 단방향만 허용.
3. 순환 의존 0.
4. UI → Service 직접 호출 금지.

## TODO

프로젝트 언어가 정해지면 위 도구 중 하나로 실제 테스트를 추가한다.
