# Create a VPC
resource "aws_vpc" "batman" {
  cidr_block       = "13.57.128.0/17"
  instance_tenancy = "default"

  tags = {
    Name = var.tag_name
  }
}
# Attach an internet gateway to the vpc "main"
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.batman.id

  tags = {
    Name = var.tag_name
  }
}
