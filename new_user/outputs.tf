output "users" {
  value = aws_iam_user.dev
}

output "password" {
  value     = { for user_profile in aws_iam_user_login_profile.developer : user_profile.user => user_profile.encrypted_password }
  sensitive = true
}
