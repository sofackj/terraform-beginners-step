resource "aws_security_group" "sglambda" {
  description = "ec2-sg"
  vpc_id      = "vpc-06b654aaaf2422e1f"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["5.50.34.152/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-sg-file-provisioner-15"
  }
}

resource "aws_instance" "ec2hello" {
  ami = "ami-0f15e0a4c8d3ee5fe"
  instance_type = "t2.micro"
  subnet_id = "subnet-0671910eaa06d0c87"
  associate_public_ip_address = true
  key_name = "nuumfactory-ec2-key-pair"
  vpc_security_group_ids = [
    aws_security_group.sglambda.id,
   ]
  tags = {
    Name = "nuumfactory-ec2-file-provisioner-15"
  }
  provisioner "file" {
    content     = "subnet-0671910eaa06d0c87"
    destination = "/tmp/ec2-subnet"
  }
}