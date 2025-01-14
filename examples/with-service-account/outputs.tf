output "service_account_details" {
  description = "서비스 계정의 세부 정보"
  value = {
    id        = module.service_account.id        # 리소스 ID
    email     = module.service_account.email     # 서비스 계정 이메일
    name      = module.service_account.name      # 서비스 계정 이름
    unique_id = module.service_account.unique_id # 서비스 계정 고유 ID
    member    = module.service_account.member    # IAM 멤버 형식의 서비스 계정 ID
  }
}

output "service_account_iam_member_details" {
  description = "IAM 멤버 정보 출력"
  value = {
    service_account_id = module.service_account_iam_member.service_account_id
    member             = module.service_account_iam_member.member
    role               = module.service_account_iam_member.role
  }
}