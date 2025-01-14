resource "google_service_account_iam_member" "iam_member" {
  # 필수 설정
  service_account_id = var.service_account_id # IAM 정책을 적용할 서비스 계정 ID
  member             = var.member             # IAM 멤버 ID (예: user:email@example.com, serviceAccount:example@project.iam.gserviceaccount.com)
  role               = var.role               # 할당할 역할 (예: roles/viewer)

  # 조건 설정 (선택적)
  dynamic "condition" {
    for_each = var.condition != null ? [var.condition] : []
    content {
      expression  = condition.value.expression  # 조건식
      title       = condition.value.title       # 조건 제목
      description = condition.value.description # 조건 설명 (Optional)
    }
  }
}