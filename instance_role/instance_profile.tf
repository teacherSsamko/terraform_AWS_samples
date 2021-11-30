resource "aws_iam_instance_profile" "BE_deployment" {
  name = "BE_Deployment_role"
  role = aws_iam_role.ec2_iam_role.name
}

data "aws_iam_policy" "EC2RoleForCodeDeploy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

data "aws_iam_policy" "CodeDeployRole" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

data "aws_iam_policy_document" "ec2_attached_policy" {
  version = "2012-10-17"
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com",
        "codedeploy.us-west-2.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "Deploy_policy" {
  source_policy_documents = [
    data.aws_iam_policy_document.ec2_attached_policy.json,
  ]
}


resource "aws_iam_role" "ec2_iam_role" {
  name               = "BE_EC2_role"
  assume_role_policy = data.aws_iam_policy_document.Deploy_policy.json
}

resource "aws_iam_role_policy" "EC2CodeDeploy" {
  name = "EC2CodeDeploy"
  role = aws_iam_role.ec2_iam_role.id

  policy = data.aws_iam_policy.EC2RoleForCodeDeploy.policy
}

resource "aws_iam_role_policy" "CodeDeployRole" {
  name = "CodeDeployRole"
  role = aws_iam_role.ec2_iam_role.id

  policy = data.aws_iam_policy.CodeDeployRole.policy
}


