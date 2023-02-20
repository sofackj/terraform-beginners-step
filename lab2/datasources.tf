data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc
  }
}
data "aws_subnet" "subpub1" {
  filter {
    name   = "tag:Name"
    values = var.elb_subnets[0]
  }
}
data "aws_subnet" "subpub2" {
  filter {
    name   = "tag:Name"
    values = var.elb_subnets[1]
  }
}
