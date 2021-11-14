resource "aws_iam_group" "Developers" {
  name = "Dev"
}

resource "aws_iam_group_policy" "dev-attach" {
  group  = aws_iam_group.Developers.name
  policy = data.aws_iam_policy_document.dev_policy.json
}
