resource "aws_security_group" "sgpublb" {
  name = "nuumfactory-${var.environment}-elb-sg-${var.digit}"
  description = "lba-sg"
  vpc_id      = var.vpc

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
    Name = "nuumfactory-${var.environment}-elb-sg-${var.digit}"
  }
}
resource "aws_security_group" "sgpubec2" {
  name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  description = "ec2-sg"
  vpc_id      = var.vpc

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
    Name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  }
}

resource "aws_security_group" "sgprivdb" {
  name = "nuumfactory-${var.environment}-db-sg-${var.digit}"
  description = "sg-db"
  vpc_id      = var.vpc

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
    Name = "nuumfactory-${var.environment}-db-sg-${var.digit}"
  }
}