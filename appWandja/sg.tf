resource "aws_security_group" "publicsubnet" {
  name        = "public-subnet"
  description = "Allow connection"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}

resource "aws_security_group" "privatesubnet" {
  name        = "private-subnet"
  description = "Allow connection"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}