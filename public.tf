resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 3, 0)
  availability_zone       = "${data.aws_region.current.name}a"
  tags                    = merge(local.tags, { Name = "devops-pub-subnet-1a" })
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 3, 1)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, { Name = "devops-pub-subnet-1b" })
}