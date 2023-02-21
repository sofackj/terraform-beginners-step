resource "aws_security_group" "sglambda" {
  description = "ec2-sg"
  vpc_id      = "vpc-06b654aaaf2422e1f"

  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["5.50.34.152/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-sg-local-exec-15"
  }
}

resource "aws_instance" "ec2hello" {
  ami = "ami-0f15e0a4c8d3ee5fe"
  instance_type = "t2.micro"
  subnet_id = "subnet-0671910eaa06d0c87"
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.sglambda.id,
   ]
  tags = {
    Name = "nuumfactory-ec2-local-exec-15"
  }
  provisioner "local-exec" {
    command = "ping -c 3 ${self.public_ip} >>  ping-local-exec"
  }
}