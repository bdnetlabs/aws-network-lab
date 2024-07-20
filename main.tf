provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      organization = "bdnetlabs"
      environment  = "lab"
      service      = "network-automation"
    }
  }
}


##### CREATE VPC FOR NETWORK AUTOMATION #####
module "network_lab_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}