data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc
  }
}
data "aws_subnet" "subpub1" {
  tags = {
    Name = var.elb_subnets[0]
  }
}
data "aws_subnet" "subpub2" {
  tags = {
    Name = var.elb_subnets[1]
  }
}