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
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
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
    private_dns_name_options {
        hostname_type                        = "resource-name"
  }
   # Execute the script when starting the instance
   user_data = file("./script-k8s-worker.sh")
  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
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
   private_dns_name_options {
        hostname_type                        = "resource-name"
  }
   # Execute the script when starting the instance
   user_data = file("./script-k8s-worker.sh")
   
   tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}