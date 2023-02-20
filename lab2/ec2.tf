resource "aws_instance" "appserver" {
   instance_type = var.ec2_type
   ami = "ami-0f15e0a4c8d3ee5fe"
   subnet_id = data.aws_subnet.subpub2.id
   # Apply security groups to the instance
   vpc_security_group_ids = [
    aws_security_group.sgpubec2.id,
   ]
   key_name = "nuumfactory-ec2-key-pair"
   associate_public_ip_address = true
   # Execute the script when starting the instance
   user_data = file("./script-apache.sh")
   
   tags = {
    name = local.ec2_sg_name
  }
}
