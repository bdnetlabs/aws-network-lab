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

##### CREATE A PUBLIC ECR REPOSITORY #####

resource "aws_ecrpublic_repository" "network-lab-ecr-repo" {
  provider = aws.us_east_1

  repository_name = "network-lab-ecr-repo"

  catalog_data {
    about_text        = "An ECR for Container Images"
    architectures     = ["ARM"]
    description       = "An ECR for Container Images"
    logo_image_blob   = filebase64(image.png)
    operating_systems = ["Linux"]
    usage_text        = "Usage Text"
  }

}