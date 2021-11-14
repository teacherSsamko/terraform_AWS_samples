resource "aws_iam_user" "dev" {
  for_each = toset(var.dev_team)
  name     = each.key
  path     = "/dev/"
}

resource "aws_iam_access_key" "newemp" {
  for_each = aws_iam_user.dev
  user     = each.key
}

resource "aws_iam_user_policy" "ec2_instance_connect" {
  for_each = aws_iam_user.dev
  name     = "ec2_instance_connect"
  user     = each.key

  policy = data.aws_iam_policy_document.ec2_instance_connect[each.key].json
}

resource "aws_iam_user_group_membership" "developer" {
  for_each = aws_iam_user.dev
  user     = each.key

  groups = [
    "Dev",
  ]

  depends_on = [
    aws_iam_user.dev
  ]
}

resource "aws_iam_user_login_profile" "developer" {
  for_each = toset(var.dev_team)
  user     = each.key
  pgp_key  = "keybase:ssamko"
}
