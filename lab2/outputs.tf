output "ssh_command" {
    value = "ssh -i ec2-private-key.pem ec2-user@${aws_instance.appserver.public_ip}"
}