resource "aws_instance" "appserver" {
   instance_type = "t2.micro"
   ami = var.ami_id
   subnet_id = aws_subnet.jskpublicsubnet.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.allow_all.id,
   ]
   # Execute the script when starting the instance
  #  user_data = file("./script-k8s-control.sh")
   
   tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
