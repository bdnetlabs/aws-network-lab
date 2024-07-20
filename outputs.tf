output "private_subnet_list" {
  description = "The ARNs of the private subnets"
  value       = module.network_lab_vpc.private_subnet_arns
}

output "public_subnet_list" {
  description = "The ARNs of the public subnets"
  value       = module.network_lab_vpc.public_subnet_arns
}

output "network_lab_ecr_uri" {
  description = "The URI for the ECR Repository"
  value = aws_ecrpublic_repository.network_lab_ecr_repo.URI
}