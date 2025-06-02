resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 3, 0)
  availability_zone       = "${data.aws_region.current.name}a"
  tags                    = merge(local.tags, { Name = "public-subnet-1a" })
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 3, 1)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, { Name = "public-subnet-1b" })
}

resource "aws_route_table_association" "public_route_table_association_pub_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_pub_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.public_route_table.id
}