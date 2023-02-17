# Create a VPC
resource "aws_vpc" "vpc1" {
  cidr_block       = "13.57.128.0/17"
  name = "jsk-vpc"
  instance_tenancy = "default"

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
# Attach an internet gateway to the vpc "main"
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc1.id
  name = "jsk-igw"

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
resource "aws_subnet" "jskpublicsubnet" {
  vpc_id                  = aws_vpc.vpc1.id
  name = "jsk-pub"
  cidr_block              = "13.57.129.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
# Add a private subnet in the vpc "main"
resource "aws_subnet" "jskprivatesubnet" {
  vpc_id                  = aws_vpc.vpc1.id
  name = "jsk-priv"
  cidr_block              = "13.57.130.0/24"
  availability_zone       = "ap-southeast-1a"

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
