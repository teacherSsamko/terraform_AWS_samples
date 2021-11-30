resource "aws_codedeploy_app" "BE" {
  name = "BE"
}

resource "aws_codedeploy_deployment_group" "BE" {
  app_name              = aws_codedeploy_app.BE.name
  deployment_group_name = "BE_group"
  service_role_arn      = aws_iam_role.ec2_iam_role.arn

  ec2_tag_filter {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "BE"
  }

  load_balancer_info {
    target_group_info {
      name = aws_lb_target_group.BE_CD.name
    }
  }
}

