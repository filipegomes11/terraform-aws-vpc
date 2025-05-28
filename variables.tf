variable "cidr_block" {
  description = "cidr of vpc"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    "Name" = "change-me"
  }
}


