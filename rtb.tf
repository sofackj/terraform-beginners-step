# Create route table for public subnets
resource "aws_route_table" "harley" {
  vpc_id = aws_vpc.batman.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = var.tag_name
  }
}
# Create route table for private subnets
resource "aws_route_table" "quinn" {
  vpc_id = aws_vpc.batman.id
  tags = {
    Name = var.tag_name
  }
}
# Associate the rtb "harley" to public subnets
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.robin.id
  route_table_id = aws_route_table.harley.id
}
# Associate the rtb "quinn" to private subnets
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.batgirl.id
  route_table_id = aws_route_table.quinn.id
}
# Associate the rtb "quinn" to a list of private subnets
resource "aws_route_table_association" "c" {
  for_each       = aws_subnet.lots_of_subnets
  subnet_id      = aws_subnet.lots_of_subnets[each.key].id
  route_table_id = aws_route_table.quinn.id
}
