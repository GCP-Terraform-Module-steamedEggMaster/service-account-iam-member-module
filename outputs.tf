# 서비스 계정 ID 출력
output "service_account_id" {
  description = "IAM 멤버가 속한 서비스 계정 ID"
  value       = google_service_account_iam_member.iam_member.service_account_id
}

# IAM 멤버 출력
output "member" {
  description = "IAM 멤버 ID (예: user:example@gmail.com, serviceAccount:example@project.iam.gserviceaccount.com)"
  value       = google_service_account_iam_member.iam_member.member
}

# 역할 출력
output "role" {
  description = "IAM 멤버에게 부여된 역할"
  value       = google_service_account_iam_member.iam_member.role
}

# 조건 출력
output "condition" {
  description = "IAM 정책의 조건 설정 (Optional)"
  value       = var.condition
}