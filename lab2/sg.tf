locals {
  elb_sg_name = "nuumfactory-${var.environment}-lb-sg-${var.digit}"
  ec2_sg_name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  db_sg_name  = "nuumfactory-${var.environment}-db-sg-${var.digit}"
}
resource "aws_security_group" "sgpublb" {
  name = var.elb_sg_name
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
    Name = "${var.elb_sg_name}"
  }
}
resource "aws_security_group" "sgpubec2" {
  name = var.ec2_sg_name
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
    Name = "${var.ec2_sg_name}"
  }
}

resource "aws_security_group" "sgprivdb" {
  name = var.db_sg_name
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
    Name = "${var.db_sg_name}"
  }
}