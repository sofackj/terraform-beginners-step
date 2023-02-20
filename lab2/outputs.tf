output "ssh_command" {
    value = "ssh -i ${var.key_file_path} ec2-user@${aws_instance.appserver.public_ip}"
}