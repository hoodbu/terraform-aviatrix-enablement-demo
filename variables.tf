variable "region" {
  type        = string
  description = "this is a decription"
  default     = "us-east-1"
}

variable "vpcs_map" {
  type = map(map(string))
  default = {
    vpc1 = {
      region = "us-east-1"
      cidr   = "10.10.100.0/24"
    }
    vpc2 = {
      region = "us-east-2"
      cidr   = "10.10.200.0/24"
    }
    vpc3 = {
      region = "us-west-1"
      cidr   = "10.10.201.0/24"
    }

  }
}
