resource "aws_lb_target_group" "BE_CD" {
  name     = "BE-target"
  port     = var.BE_deployment_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

}

data "aws_vpc" "default" {
  default = true
}
