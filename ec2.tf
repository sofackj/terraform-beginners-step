resource "aws_instance" "k8s-controler" {
   instance_type = "t2.micro"
   ami = var.ami_id
   subnet_id = aws_subnet.robin.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.allow_all.id,
   ]
   # Execute the script when starting the instance
   user_data = file("./script-k8s-control.sh")
   
   tags = {
    Name = "k8s-controller"
  }
}
resource "aws_instance" "k8s-worker-1" {
   instance_type = "t2.micro"
   ami = var.ami_id
   subnet_id = aws_subnet.robin.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.allow_all.id,
   ]
   # Execute the script when starting the instance
   user_data = file("./script-k8s-worker-1.sh")
   
   tags = {
    Name = "k8s-worker"
  }
}
resource "aws_instance" "k8s-worker-2" {
   instance_type = "t2.micro"
   ami = var.ami_id
   subnet_id = aws_subnet.robin.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.allow_all.id,
   ]
   # Execute the script when starting the instance
   user_data = file("./script-k8s-worker-2.sh")
   
   tags = {
    Name = "k8s-worker"
  }
}