locals {
  tags = {
    Department   = "DevOps"
    Organization = "infrastructure"
  }

  public_subnets = {
    for idx, az in var.availability_zones :
    "1${az}" => {
      cidr_sufix = idx
      az         = "${data.aws_region.current.name}${az}"
    }
  }

  private_subnets = {
    for idx, az in var.availability_zones :
    "1${az}" => {
      cidr_sufix = idx + length(var.availability_zones)
      az         = "${data.aws_region.current.name}${az}"
    }
  }

}