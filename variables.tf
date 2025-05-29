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


