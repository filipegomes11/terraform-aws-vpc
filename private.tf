resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 3, 2)
  availability_zone = "${data.aws_region.current.name}a"
  tags              = merge(local.tags, { Name = "devops-priv-subnet-1a" })
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 3, 3)
  availability_zone = "${data.aws_region.current.name}b"
  tags              = merge(local.tags, { Name = "devops-privsubnet-1b" })
}