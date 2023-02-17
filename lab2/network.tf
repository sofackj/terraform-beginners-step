# Create a VPC
# resource "aws_vpc" "vpc1" {
#   cidr_block       = "13.57.128.0/17"
#   instance_tenancy = "default"

#   tags = {
#     owner =  "jsofack-lemaire@thenuumfactory.fr"
#     ephemere = "oui"
#     entity =  "numfactory"
#   }
# }
# Attach an internet gateway to the vpc "main"
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.vpc1.id

#   tags = {
#     owner =  "jsofack-lemaire@thenuumfactory.fr"
#     ephemere = "oui"
#     entity =  "numfactory"
#   }
# }
resource "aws_subnet" "publicsubnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.111.128/25"
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name = "nuumfactory-dev-db-subpub-15"
  }
}
# Add a private subnet in the vpc "main"
resource "aws_subnet" "privatesubnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.111.0/25"
  availability_zone       = "eu-west-3b"

  tags = {
    Name = "nuumfactory-dev-db-subpriv-15"
  }
}
