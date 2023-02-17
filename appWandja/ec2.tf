resource "aws_instance" "appserver" {
   instance_type = "t2.micro"
   name = "jsk-ec2"
   ami = var.ami_id
   subnet_id = aws_subnet.jskpublicsubnet.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.publicsubnet.id,
   ]
   # Execute the script when starting the instance
   user_data = file("./script-apache.sh")
   
   tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
