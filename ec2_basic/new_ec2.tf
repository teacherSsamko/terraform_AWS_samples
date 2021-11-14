resource "aws_instance" "app_server" {
  ami           = var.ami_amazon_linux2
  instance_type = "t2.small"

  tags = {
    Name = var.ec2_name
  }
}
