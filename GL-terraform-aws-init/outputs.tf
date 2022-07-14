output "MAIL_USERNAME" {
  value     = aws_iam_access_key.smtp_user.id
  sensitive = true
}

output "MAIL_PASSWORD" {
  value     = aws_iam_access_key.smtp_user.ses_smtp_password_v4
  sensitive = true
}

output "OIDC_ARN" {
  value = aws_iam_role.oidc-default.arn
}

output "EFS_ID" {
  value = aws_efs_file_system.efs-prod.id
}

output "MYSQL_URL" {
  value = aws_db_instance.snipe-it-db.endpoint  
}

output "ECR_URL" {
  value = aws_ecr_repository.ecr.repository_url
}