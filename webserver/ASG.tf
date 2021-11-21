resource "aws_launch_configuration" "example" {
  image_id        = var.ami_ubuntu
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_server.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello Ssamko" > index.html
    nohup busybox httpd -f -p ${var.server_port} &
    EOF

  # Required when using a launch configuration with an auto scaling group
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
