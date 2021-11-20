resource "aws_instance" "app_server" {
  ami                    = var.ami_ubuntu
  instance_type          = "t2.small"
  vpc_security_group_ids = [aws_security_group.web_server.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, ssamko" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = var.ec2_name
  }

}
