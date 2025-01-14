module "service_account" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/service-account-module.git?ref=v1.0.0"

  account_id = "test-sa"
}

module "service_account_iam_member" {
  source = "../../" # 모듈 경로 지정

  service_account_id = module.service_account.id
  member             = "user:terraformpracticetest@gmail.com" # IAM 멤버
  role               = "roles/editor"                         # 할당할 IAM 역할
}