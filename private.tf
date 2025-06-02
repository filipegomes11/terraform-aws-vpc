resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 3, 2)
  availability_zone = "${data.aws_region.current.name}a"
  tags              = merge(local.tags, { Name = "private-subnet-1a" })
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 3, 3)
  availability_zone = "${data.aws_region.current.name}b"
  tags              = merge(local.tags, { Name = "private-subnet-1b" })
}

resource "aws_route_table_association" "private_route_table_association_priv_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_route_table_1a.id
}

resource "aws_route_table_association" "private_route_table_association_priv_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.private_route_table_1b.id
}
