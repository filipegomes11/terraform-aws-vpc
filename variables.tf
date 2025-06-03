variable "cidr_block" {
  description = "cidr of vpc - required"
  type        = string
}

variable "vpc_tags" {
  type = map(string)
  default = {
    "Name" = "change-me"
  }
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "availability_zones" {
  type    = list(string)
  default = ["a", "b"]
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Private subnet additional tags"
  default     = {}
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Public subnet additional tags"
  default     = {}
}

