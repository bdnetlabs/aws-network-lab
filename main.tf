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
module "netautomation_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "ansible-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"
  count   = 1

  name = "ansible"

  ami                         = "ami-0f79abea6c14ac085"
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = [module.netautomation_vpc.default_security_group_id]
  subnet_id                   = module.netautomation_vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = "automation-server-key"
}