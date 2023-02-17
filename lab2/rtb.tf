# Create route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "nuumfactory-dev-rtb-pub-15"
  }
}
# Create route table for private subnets
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags = {
    Name = "nuumfactory-dev-rtb-pub-15"
  }
}
# Associate the rtb "harley" to public subnets
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.public.id
}
# Associate the rtb "quinn" to private subnets
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.private.id
}

