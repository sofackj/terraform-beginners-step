resource "aws_security_group" "sgpublb" {
  name = "nuumfactory-dev-elb-sg-15"
  description = "lba-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-dev-elb-sg-15"
  }
}
resource "aws_security_group" "sgpubec2" {
  name = "nuumfactory-dev-ec2-sg-15"
  description = "ec2-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.sgpublb.id]
  }

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
    Name = "nuumfactory-dev-ec2-sg-15"
  }
}

resource "aws_security_group" "sgprivdb" {
  name = "nuumfactory-dev-db-sg-15"
  description = "sg-db"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups      = [aws_security_group.sgpubec2.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-dev-db-sg-15"
  }
}