resource "aviatrix_vpc" "aws_vpc" {
  cloud_type           = 1
  account_name         = "aws-account"
  region               = "us-east-1"
  name                 = "tf-enablement-vpc"
  cidr                 = "10.0.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}
