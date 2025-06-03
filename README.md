<!-- BEGIN_TF_DOCS -->


## Example

```hcl
#versions.tf
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#main.tf

module "vpc" {
  source               = "../"
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tags             = var.vpc_tags
}

#variables.tf

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    "Name" = "vpc-core"
  }
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | n/a | `list(string)` | <pre>[<br/>  "a",<br/>  "b"<br/>]</pre> | no |
| cidr\_block | cidr of vpc - required | `string` | n/a | yes |
| enable\_dns\_hostnames | Enable DNS hostnames in the VPC | `bool` | `true` | no |
| enable\_dns\_support | Enable DNS support in the VPC | `bool` | `true` | no |
| vpc\_tags | n/a | `map(string)` | <pre>{<br/>  "Name": "change-me"<br/>}</pre> | no |
## Outputs

| Name | Description |
|------|-------------|
| private\_subnet\_ids | Private Subnets ID |
| public\_subnet\_ids | Public Subnets ID |
| vpc\_id | VPC ID |
## Providers

| Name | Version |
|------|---------|
| aws | 5.99.1 |
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| aws | >= 4.0 |
## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
<!-- END_TF_DOCS -->