output "ec2_id" {
  value = aws_instance.app_server.id
}

output "public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "Public IP address of the web server"
}
