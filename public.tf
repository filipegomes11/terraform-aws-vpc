resource "aws_subnet" "public" {
  for_each                = local.public_subnets
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 3, each.value.cidr_sufix)
  availability_zone       = each.value.az
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, var.public_subnet_tags, { Name = "public-subnet-${each.key}" })

}

resource "aws_route_table_association" "public" {
  for_each       = local.public_subnets
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public_route_table.id
}
