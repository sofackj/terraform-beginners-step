# Add a public subnet in the vpc "main"
resource "aws_subnet" "robin" {
  vpc_id                  = aws_vpc.batman.id
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
resource "aws_subnet" "batgirl" {
  vpc_id                  = aws_vpc.batman.id
  cidr_block              = "13.57.130.0/24"
  availability_zone       = "ap-southeast-1a"

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
# Add public subnets in the vpc "main"
resource "aws_subnet" "lots_of_subnets" {
  for_each                = var.my_first_loop
  vpc_id                  = aws_vpc.batman.id
  cidr_block              = each.value["sub_cidr"]
  availability_zone       = "ap-southeast-1c"
  map_public_ip_on_launch = true

  tags = {
    owner =  "jsofack-lemaire@thenuumfactory.fr"
    ephemere = "oui"
    entity =  "numfactory"
  }
}
