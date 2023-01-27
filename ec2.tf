resource "aws_instance" "joker" {
   instance_type = "t2.micro"
   ami = var.ami_id
   subnet_id = aws_subnet.robin.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
   ]
   # Execute the script when starting the instance
   user_data = file("./script-ec2.sh")
   
   tags = {
    Name = "julien-server"
  }
}