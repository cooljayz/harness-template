# Architecture

## 계층 의존성 (Layered Dependencies)

의존성은 **단방향**으로만 흐른다. 위 계층은 아래 계층을 참조할 수 없다.

```
UI         ← 최상위. 사용자 인터페이스, 프리젠테이션
 ↑
Runtime    ← 진입점, 부팅, DI 컨테이너, HTTP/CLI 핸들러
 ↑
Service    ← 유스케이스, 비즈니스 오케스트레이션
 ↑
Repo       ← 영속성, 외부 API 어댑터
 ↑
Config     ← 환경 구성, 시크릿 로딩
 ↑
Types      ← 순수 타입, 도메인 모델, 에러, 값 객체 (의존성 0)
```

**규칙**
1. `Types`는 아무것도 import 하지 않는다.
2. 각 계층은 자신보다 아래 계층만 import 한다. 같은 계층은 허용.
3. 순환 의존은 금지.
4. UI는 Service 이하를 직접 호출하지 않는다 — Runtime을 통해서만.

이 규칙은 `tests/architecture/`의 구조 테스트로 **기계적으로** 강제된다. 규칙을 바꾸려면 테스트를 먼저 바꾸고, 이 문서를 같은 PR에서 갱신한다.

## 모듈 경계

각 모듈은 자신의 `README.md`를 가지고, 다음을 명시한다:
- 이 모듈이 소유한 개념 (도메인 용어)
- 공개 인터페이스 (외부에서 쓸 수 있는 것)
- 내부 구현 (외부에서 import 금지)

## 불변식 (Architecture Invariants)

- 모든 외부 I/O는 `Repo` 계층 뒤에 숨겨져야 한다. `Service`는 외부 SDK/HTTP를 직접 호출하지 않는다.
- 구성 값은 `Config` 계층에서 한 번만 읽는다. 런타임 중 재조회 금지.
- 로그/메트릭은 `docs/quality/observability.md`의 표준을 따른다.

## 변경 프로세스

아키텍처 변경은 다음 순서로:
1. `docs/design/` 아래 ADR(Architecture Decision Record) 초안 작성
2. 구조 테스트 업데이트
3. 코드 마이그레이션
4. 이 문서 갱신
