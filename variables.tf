variable "my_public_ip" {
  description = "My Public IP Address"
  type        = string
  sensitive   = true
}


#########################
##### VPC VARIABLES #####
#########################

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "network-lab-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    CreatedByModule = "vpc_module"
  }
}

#########################
##### VPC VARIABLES #####
#########################

variable "ec2_instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.medium"
}