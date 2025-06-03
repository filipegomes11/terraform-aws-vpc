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
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
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
