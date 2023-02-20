output "instance_ip_addr" {
  value = aws_instance.appserver.public_ip
}