# service-account-iam-member-module
GCP Terraform Service Account Iam Member Module Repo

GCP에서 서비스 계정에 대한 IAM 멤버 권한을 할당하고 관리하기 위한 Terraform 모듈입니다.  
이 모듈은 서비스 계정과 IAM 역할을 쉽게 연결하고 관리하도록 설계되었습니다.

<br>

## 📑 **목차**
1. [모듈 특징](#모듈-특징)
2. [사용 방법](#사용-방법)
    1. [사전 준비](#1-사전-준비)
    2. [입력 변수](#2-입력-변수)
    3. [모듈 호출 예시](#3-모듈-호출-예시)
    4. [출력값 (Outputs)](#4-출력값-outputs)
    5. [지원 버전](#5-지원-버전)
    6. [모듈 개발 및 관리](#6-모듈-개발-및-관리)
3. [테스트](#terratest를-이용한-테스트)
4. [주요 버전 관리](#주요-버전-관리)
5. [기여](#기여-contributing)
6. [라이선스](#라이선스-license)

---

## 모듈 특징

- 서비스 계정에 대한 권한을 IAM 멤버에 할당.
- 사용자, 그룹 또는 서비스 계정을 기반으로 IAM 역할 설정 가능.
- 조건부 IAM 정책 지원.
- 생성된 IAM 멤버의 주요 속성 출력.

---

## 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/iam.serviceAccountAdmin`.

<br>

### 2. 입력 변수

| 변수명               | 타입   | 필수 여부 | 기본값 | 설명                                                                 |
|----------------------|--------|-----------|--------|----------------------------------------------------------------------|
| `service_account_id` | string | ✅        | 없음   | IAM 정책을 적용할 서비스 계정 ID                                      |
| `member`             | string | ✅        | 없음   | IAM 멤버 ID (예: `user:email@example.com`, `serviceAccount:example@project.iam.gserviceaccount.com`) |
| `role`               | string | ✅        | 없음   | 할당할 역할 (예: `roles/viewer`)                                      |
| `condition`          | object | ❌        | `null` | 조건부 IAM 정책 설정. 조건이 없는 경우 `null`로 설정. 아래 예시 참조. |

<br>

### 3. 모듈 호출 예시

```hcl
module "iam_member" {
  source              = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/service-account-iam-member-module.git?ref=v1.0.0"

  service_account_id   = "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
  member               = "user:example@gmail.com"
  role                 = "roles/editor"
  condition = {
    expression  = "request.time < timestamp('2023-12-31T23:59:59Z')"
    title       = "Temporary Access"
    description = "Temporary access for the end of the year"
  }
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명                | 설명                                                                 |
|-----------------------|----------------------------------------------------------------------|
| `service_account_id`  | IAM 멤버가 속한 서비스 계정 ID                                       |
| `member`              | IAM 멤버 ID (예: `user:example@gmail.com`, `serviceAccount:example@project.iam.gserviceaccount.com`) |
| `role`                | IAM 멤버에게 부여된 역할                                             |
| `condition`           | IAM 정책의 조건 설정                                                |

<br>

### 5. 지원 버전

#### a.  Terraform 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `1.10.3`   | 최신 버전, 지원 및 테스트 완료                  |

#### b. Google Provider 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `~> 6.0`  | 최소 지원 버전                   |

<br>

### 6. 모듈 개발 및 관리

- **저장소 구조**:
  ```
  service-account-iam-member-module/
  ├── .github/workflows/  # github actions 자동화 테스트
  ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
  ├── test/               # 테스트 구성 디렉터리
  ├── main.tf             # 모듈의 핵심 구현
  ├── variables.tf        # 입력 변수 정의
  ├── outputs.tf          # 출력 정의
  ├── versions.tf         # 버전 정의
  ├── README.md           # 문서화 파일
  ```
<br>

---

## Terratest를 이용한 테스트
이 모듈을 테스트하려면 제공된 Go 기반 테스트 프레임워크를 사용하세요. 아래를 확인하세요:

1. Terraform 및 Go 설치.
2. 필요한 환경 변수 설정 (GCP_PROJECT_ID, API_SERVICES 등).
3. 테스트 실행:
```bash
go test -v ./test
```

<br>

## 주요 버전 관리
이 모듈은 [Semantic Versioning](https://semver.org/)을 따릅니다.  
안정된 버전을 사용하려면 `?ref=<version>`을 활용하세요:

```hcl
source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/service-account-iam-member-module.git?ref=v1.0.0"
```

### Module ref 버전
| Major | Minor | Patch |
|-----------|-----------|----------|
| `1.0.0`   |    |   |


<br>

## 기여 (Contributing)
기여를 환영합니다! 버그 제보 및 기능 요청은 GitHub Issues를 통해 제출해주세요.

<br>

## 라이선스 (License)
[MIT License](LICENSE)