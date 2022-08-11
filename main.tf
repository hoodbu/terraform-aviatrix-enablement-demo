# resource "aviatrix_vpc" "aws_vpc" {
#   cloud_type           = 1
#   account_name         = "aws-account"
#   region               = var.region
#   name                 = "tf-enablement-vpc"
#   cidr                 = "10.0.0.0/16"
#   aviatrix_transit_vpc = false
#   aviatrix_firenet_vpc = false
# }

# resource "aviatrix_vpc" "aws_vpc2" {
#   cloud_type           = 1
#   account_name         = "aws-account"
#   region               = var.region
#   name                 = "tf-enablement-vpc2"
#   cidr                 = "10.1.0.0/16"
#   aviatrix_transit_vpc = false
#   aviatrix_firenet_vpc = false
# }

# resource "aviatrix_gateway" "test_gateway_aws" {
#   cloud_type   = 1
#   account_name = "aws-account"
#   gw_name      = "avtx-gw-1"
#   vpc_id       = aviatrix_vpc.aws_vpc.vpc_id
#   vpc_reg      = aviatrix_vpc.aws_vpc.region
#   gw_size      = "t3.micro"
#   subnet       = aviatrix_vpc.aws_vpc.public_subnets[0].cidr
#   tags = {
#     name = "VPC1 GW"
#   }
# }

# data "aviatrix_vpc" "vpc_dsn" {
#   name = "tf-enablement-vpc3"
# }

# resource "aviatrix_vpc" "vpc" {
#   count        = length(var.vpcs)
#   cloud_type   = 1
#   account_name = "aws-account"
#   name         = var.vpcs[count.index].name
#   region       = var.vpcs[count.index].region
#   cidr         = var.vpcs[count.index].cidr

resource "aviatrix_vpc" "vpcs_map" {
  cloud_type   = 1
  for_each     = var.vpcs_map
  account_name = "aws-account"
  name         = each.key
  region       = each.value.region
  cidr         = each.value.cidr
}

output "region" {
  value = var.region
}
# output "first_vpc_name" {
#   value = aviatrix_vpc.vpcs_map["vpc1"]
# }
# Create map output
output "vpc_private_subnet_cidr" {
  #value = { for vpc in aviatrix_vpc.vpc : vpc.name => vpc.private_subnets[0].subnet_id }
  value = { for vpc in aviatrix_vpc.vpcs_map : vpc.name => vpc.private_subnets[0].cidr }
}

