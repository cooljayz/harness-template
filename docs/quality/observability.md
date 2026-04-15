# Observability Standards

## 로그

- 구조화 로그(JSON)만 사용. 문자열 보간 금지.
- 필드: `ts`, `level`, `service`, `trace_id`, `event`, `...context`
- 레벨: `debug` (개발), `info` (상태 전이), `warn` (복구 가능), `error` (실패)

## 메트릭

- 이름: `<domain>_<unit>_<aggregation>` — 예: `auth_login_attempts_total`
- A 등급 기능은 SLI/SLO를 이 문서에 함께 등록한다.

## 트레이스

- 모든 외부 I/O는 스팬으로 감싼다 (Repo 계층).
- `trace_id`는 로그 필드와 동일한 키로 상관.

## 에이전트 디버깅 피드백 루프

실패한 테스트/알람은 구조화된 JSON으로 에이전트가 읽을 수 있는 형태로 `artifacts/`에 남긴다. 에이전트는 그 파일을 입력으로 삼아 후속 수정을 수행한다.
