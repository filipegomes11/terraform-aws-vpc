resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(local.tags, {
    Name = format("%s-igw", var.vpc_tags["Name"])
    }
  )
}

