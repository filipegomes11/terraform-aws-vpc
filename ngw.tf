resource "aws_eip" "nat" {
  for_each = local.private_subnets
  domain   = "vpc"
  tags     = merge(local.tags, { Name = "eip-${each.key}" })
}

resource "aws_nat_gateway" "this" {
  for_each      = local.private_subnets
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id
  tags          = merge(local.tags, { Name = "nat-gateway-${each.key}" })
  depends_on    = [aws_internet_gateway.this]
}


resource "aws_route_table" "private" {
  for_each = local.private_subnets
  vpc_id   = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[each.key].id
  }
  tags = merge(local.tags, { Name = "private-rtb-${each.key}" })
}
